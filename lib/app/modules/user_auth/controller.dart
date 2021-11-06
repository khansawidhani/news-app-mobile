// ignore_for_file: avoid_print

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app_flutter/constants/constant.dart';

class AuthController extends GetxController {
  late Rx<User?> firebaseUser;
  late Rx<GoogleSignInAccount?> googleSignInAccount;
  Rx<bool> isCreated = false.obs;
  Rx<bool> isLoading = true.obs;

  @override
  void onReady() async {
    super.onReady();
    // auth is comning from the constants.dart file but it is basically FirebaseAuth.instance.
    // Since we have to use that many times I just made a constant file and declared there
    firebaseUser = Rx<User?>(Constants.auth.currentUser);

    Rx<GoogleSignInAccount?> googleSignInAccount =
        Rx<GoogleSignInAccount?>(Constants.googleSign.currentUser);

    firebaseUser.bindStream(Constants.auth.userChanges());
    ever(firebaseUser, _setInitialScreen);

    googleSignInAccount.bindStream(Constants.googleSign.onCurrentUserChanged);
    ever(googleSignInAccount, _setInitialScreenGoogle);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      // if the user is not found then the user is navigated to the Signup Screen
      Get.offAllNamed('/login');
    } else {
      if (Constants.prefs!.getBool('loggedin') == true) {
        Get.offAllNamed('/home');
      }
      // if the user exists and logged in the the user is navigated to the Home Screen
    }
  }

  _setInitialScreenGoogle(GoogleSignInAccount? googleSignInAccount) {
    print(googleSignInAccount);
    if (googleSignInAccount == null) {
      // if the user is not found then the user is navigated to the Register Screen
      Get.offNamed('/login');
    } else {
      Constants.prefs!.getBool("loggedin") == true ? Get.offNamed('/home') : CircularProgressIndicator();
      // if the user exists and logged in the the user is navigated to the Home Screen
    }
  }
  showSuccessDialog(){
    Get.defaultDialog(
            title: 'Success!',
            titleStyle: TextStyle(
                color: Colors.green[800], fontWeight: FontWeight.bold),
            content: const Text(
                'Account created successfully. \n Do you want to login now?',
                style: TextStyle(color: Colors.black)),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[800]),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Confirm'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[800]),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ],
          );
  }
  showSuccess(String successMsg) {
    return Get.snackbar(
      'Error', successMsg,
      messageText: Text(
        successMsg,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.black,
      backgroundColor: Colors.green,
      // duration: const Duration(milliseconds: 5000),
      isDismissible: true,
      // mainButton: TextButton(
      //     onPressed: () {
      //       if(isCreated.isFalse){
      //         isCreated.toggle();
      //       }
      //       print(isCreated);

      //     },
      //     child: const Text(
      //       'Dismiss',
      //       style: TextStyle(color: Colors.white),
      //     ))
    );
  }

  showError(String errorMsg) {
    return Get.snackbar('Error', errorMsg,
        messageText: Text(
          errorMsg,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        snackPosition: SnackPosition.BOTTOM,
        colorText: Colors.black,
        backgroundColor: const Color(0xFFAF1605),
        duration: const Duration(milliseconds: 5000),
        isDismissible: true,
        mainButton: TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              'Dismiss',
              style: TextStyle(color: Colors.white),
            )));
  }

  void signInWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount =
          await Constants.googleSign.signIn();

      if (googleSignInAccount != null) {
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await Constants.auth.signInWithCredential(credential);
        User? user = userCredential.user;
        // setting variables
        String name = user!.displayName.toString();
        String email = user.email.toString();
        String photoUrl = user.photoURL.toString();
        String uid = user.uid;
        await Constants.firebaseFirestore.collection('users').doc(uid).set({
          'fullname' : name,
          'email' : email, 
          'photoUrl' : photoUrl
        }).then((value) => {
          Get.defaultDialog(
            title: 'Success',
            content: Text('Your google account has been connected', style: TextStyle(
                color: Colors.green[800], fontWeight: FontWeight.bold)),
            actions: [
              TextButton(
                onPressed: () {
                  Constants.prefs!.setBool("loggedin", true);
                  Constants.prefs!.setString("uid", user.uid);
                  Get.offAllNamed('/home');
                },
                child: const Text('Continue'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[800]),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ],
          ),
        }
        ).catchError((error)=> throw error);
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

// ======================================================================

  void signup(String fullname, String email, String password,
      String confirmPassword) async {
    // checking whether if both passwords are same or not
    if (password == confirmPassword) {
      // let's add user to data
      try {
        UserCredential userCredential = await Constants.auth
            .createUserWithEmailAndPassword(email: email, password: password);
        String uid = userCredential.user!.uid;
            await Constants.firebaseFirestore.collection('users').doc(uid).set({
          'fullname': fullname,
          'email': email,
        }).then((value) {
          Get.defaultDialog(
            title: 'Success!',
            titleStyle: TextStyle(
                color: Colors.green[800], fontWeight: FontWeight.bold),
            content: const Text(
                'Account created successfully. \n Do you want to login now?',
                style: TextStyle(color: Colors.black)),
            actions: [
              TextButton(
                onPressed: () {
                  Get.back();
                },
                child: const Text('Cancel'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red[800]),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.offNamed('/login');
                },
                child: const Text('Confirm'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green[800]),
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                ),
              ),
            ],
          );
        }).catchError((error) => throw error);
      } on FirebaseAuthException catch (error) {
        print(error);
        if (error.code == 'email-already-in-use') {
          showError("Email already exist. Try login");
        } else if (error.code == "weak-password") {
          showError("The password is too weak. Try another");
        } else {
          print(FirebaseAuthException);
          showError("Something went wrong. Try again");
        }
      }
    } else {
      showError("Passwords doesn't match");
    }
  }

// ===============================================================

  void login(String email, password) async {
    try {
      final UserCredential userCredential = await Constants.auth
          .signInWithEmailAndPassword(email: email, password: password);
      print("Login Successful => ${userCredential.user!.email}");
      Constants.prefs!.setBool("loggedin", true);
      Constants.prefs!.setString("uid", userCredential.user!.uid);
      Get.offAllNamed('/home');
    } catch (firebaseAuthException) {
      print(firebaseAuthException);
    }
  }

  Future signOut() async {
    await Constants.auth.signOut();
    Constants.prefs!.setBool("loggedin", false);
    Constants.prefs!.remove("uid");
    Get.offNamed('/login');
  }
}
