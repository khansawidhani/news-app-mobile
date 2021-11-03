import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Constants{

static AuthController authController = AuthController();
static Future<FirebaseApp> firebaseInitialization = Firebase.initializeApp();
static FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
static GoogleSignIn googleSign = GoogleSignIn();
static SharedPreferences? prefs;

}


