import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app_flutter/app/core/theme/app_theme.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';
import 'package:news_app_flutter/app/routes/pages.dart';
import 'package:news_app_flutter/constants/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();
  
  await Constants.firebaseInitialization;
  Get.put(AuthController());
  runApp( const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({ Key? key }) : super(key: key);

  @override

Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: Constants.firebaseInitialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Center(child: Text("Has error"),);
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
      title: "News App Flutter", 
      debugShowCheckedModeBanner: false,
      theme : appTheme() ,
      getPages: AddPages.pages,
      initialRoute: '/login',
      //  == true ? '/home' : 
    );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(child: CircularProgressIndicator(color: Colors.red,),);
      },
    );
  }









}