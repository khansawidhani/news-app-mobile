import 'package:flutter/material.dart';

appTheme() {
  return ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.red,
      textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.bold, fontSize: 25), 
              subtitle1: TextStyle(color: Colors.white70, fontSize: 16.0),
              button: TextStyle(color: Colors.white.withOpacity(0.9), fontWeight: FontWeight.normal, fontSize: 16.0, letterSpacing: 0.5)
              ),
      
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0),), borderSide: BorderSide(color: Colors.grey)

        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0),), borderSide: BorderSide(color: Colors.white)

        ),
        hintStyle: TextStyle(color: Colors.grey),
        labelStyle: TextStyle(color: Colors.grey, fontSize: 16.0),
        floatingLabelStyle: TextStyle(color: Colors.white, fontSize: 22.0),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0),), borderSide: BorderSide(color: Colors.grey)
            , 
            ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0.0),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            side: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(15.0))),),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          
        )
      )
      );
}
