// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_flutter/app/constants/constant.dart';
import 'package:news_app_flutter/app/core/theme/app_theme.dart';
import 'package:news_app_flutter/app/data/model/article_hive.dart';
import 'package:news_app_flutter/app/data/model/boxes.dart';
import 'package:news_app_flutter/app/data/model/saved_user.dart';
import 'package:news_app_flutter/app/data/model/source_hive.dart';
import 'package:news_app_flutter/app/global/binding/init_binding.dart';
import 'package:news_app_flutter/app/modules/dashboard/binding.dart';
import 'package:news_app_flutter/app/modules/dashboard/view.dart';
import 'package:news_app_flutter/app/modules/home/view.dart';
import 'package:news_app_flutter/app/modules/news/view.dart';
import 'package:news_app_flutter/app/modules/user_auth/login/view.dart';
import 'package:news_app_flutter/app/routes/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SavedUserAdapter());
  Hive.registerAdapter(HiveSourceAdapter());
  Hive.registerAdapter(HiveArticleAdapter());
  await Hive.openBox<HiveArticle>('articles');
  await Hive.openBox<SavedUser>('localUser');
  await Constants.firebaseInitialization;  

  InitBinding().dependencies();


  runApp(const NewsApp());
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
          var localUser = Boxes.getLocalUser();
          bool isHome = localUser.isNotEmpty && localUser.values.first.isLoggedin == true ; 
          // print(localUser.length);
          // print("isHome $isHome");
          return GetMaterialApp(
      title: "News App Flutter", 
      debugShowCheckedModeBanner: false,
      theme : appTheme() ,
      getPages: AddPages.pages,
      initialRoute: isHome == true ? '/dashboard' : '/login',
    );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(child: CircularProgressIndicator(color: Colors.red,),);
      },
    );
  }
}






