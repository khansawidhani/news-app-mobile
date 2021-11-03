import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuth extends GetxController{
  final GlobalKey loginFormKey = GlobalKey();
  final GlobalKey signupFormKey = GlobalKey();
    FirebaseAuth _auth = FirebaseAuth.instance;



  signup(TextEditingController username, TextEditingController email, TextEditingController password, TextEditingController confirmPassword)async{
    if(username.text != "" && email.text != "" && password.text != "" && confirmPassword.text != ""){
      if(password.text == confirmPassword.text){
        try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: "barry.allen@example.com",
    password: "SuperSecretPassword!"
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
    print("Username : ${username.text}");
    print("Email : ${email.text}");
    print("Password : ${password.text}");
    print("Confirm Password : ${confirmPassword.text}");
      }
      else{
        print("Passwords doesn't match");
      }
      
      
    }
    else{
       print("All fields are required"); 
      }
  username.clear();
  email.clear();
  password.clear();
  confirmPassword.clear();
  update();
  }
  login(TextEditingController email, TextEditingController password){
    if(email.text != "" && password.text != ""){
        print("Email : ${email.text}");
    print("Password : ${password.text}");

    }
    else{
      print("All fields are required");
    }

  }
}