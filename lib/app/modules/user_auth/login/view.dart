import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({ Key? key }) : super(key: key);
  String title = 'Login Page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(child: Text(title),),
    );
  }
}