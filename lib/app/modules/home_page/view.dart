import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';
import 'package:news_app_flutter/constants/constant.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);
  final authController = Get.find<AuthController>();
  final String title = "HomePage";  
  bool islogin = Constants.prefs!.getBool('loggedin') == true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: Text(title),),
      body: Center(
        child: Column(
          children: [
            Container(
child: Text( islogin? "Welcome ${Constants.prefs!.getString('uid').toString()}":"Welcome Guest", style: TextStyle(color: Colors.indigo, fontSize: 20.0),),
            ),
            ElevatedButton(onPressed: (){
            
              authController.signOut();
            },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.grey)),
             child: Text("Logout", style: TextStyle(color: Colors.black),))
          ],
        ),
      ),
    );
  }
}