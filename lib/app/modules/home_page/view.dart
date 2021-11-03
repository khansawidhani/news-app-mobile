import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';
import 'package:news_app_flutter/constants/constant.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);
  final authController = Get.find<AuthController>();
  final String title = "HomePage";  
  final data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    
    print(data);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: Column(
          children: [
            Container(
child: Text(data != null ? Constants.prefs!.getString("uid").toString(): "Welcome Guest", style: TextStyle(color: Colors.white, fontSize: 20.0),),
            ),
            ElevatedButton(onPressed: (){
              authController.signOut();
            }, child: Text("Logout"))
          ],
        ),
      ),
    );
  }
}