import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app_flutter/app/modules/user_auth/signup/view.dart';
import 'package:news_app_flutter/constants/constant.dart';

class AuthController extends GetxController {
  //  AuthController instance = Get.find();
  late Rx<User?> firebaseUser;    
  // late Rx<GoogleSignInAccount?> googleSignInAccount;

  @override
  void onReady() async{
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance. 
    // Since we have to use that many times I just made a constant file and declared there
    firebaseUser = Rx<User?>(Constants.auth.currentUser);

    Rx<GoogleSignInAccount?> googleSignInAccount = Rx<GoogleSignInAccount?>(Constants.googleSign.currentUser);
      firebaseUser.bindStream(Constants.auth.userChanges());
      ever(firebaseUser, _setInitialScreen);

    
    googleSignInAccount.bindStream(Constants.googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Signup Screen
      Get.offNamed('/login');
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offNamed('/home', arguments: Constants.prefs!.getString("uid"));
    }
  }
  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offNamed('/login');
    } else {
      // if the user exists and logged in the the user is navigated to the Home Screen
      Get.offNamed('/home', arguments: Constants.prefs!.getString("uid"));
    }
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await Constants.googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential = await Constants.auth.signInWithCredential(
          credential);
          Constants.prefs!.setBool("loggedin", true);
      Constants.prefs!.setString("uid", userCredential.user!.uid);
            // .catchError((onErr) => print(onErr));

            print("Signin Google Successful $userCredential");
            Get.offAllNamed('/home', arguments: Constants.prefs!.getString("uid"));



      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
      print(e.toString());
    }
  }

  void signup(String fullname, email, password) async {
    try {
      final UserCredential userCredential = await Constants.auth.createUserWithEmailAndPassword(
          email: email, password: password);
          print("Registeration Success ${userCredential.user!.email} \n ${userCredential.user!.displayName}");    
          
          Get.offNamed('/login');  
    } catch (firebaseAuthException) {
      print(firebaseAuthException);
    }
  }

  void login(String email, password) async {
    try {
      final UserCredential userCredential =  await Constants.auth.signInWithEmailAndPassword(email: email, password: password);
      print("Login Successful => ${userCredential.user!.email}");
      Constants.prefs!.setBool("loggedin", true);
      Constants.prefs!.setString("uid", userCredential.user!.uid);
      Get.offAllNamed('/home', arguments: userCredential.user!.uid);
    } catch (firebaseAuthException) {
      print(firebaseAuthException);

    }
  }

  void signOut() async {
    await Constants.auth.signOut();
    Constants.prefs!.setBool("loggedin", false);
    Constants.prefs!.remove("uid");
    Get.offNamed('login');
  }
}
