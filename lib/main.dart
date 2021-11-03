import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_app_flutter/app/core/theme/app_theme.dart';
import 'package:news_app_flutter/app/routes/pages.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp( NewsApp());
}

class NewsApp extends StatelessWidget {
  NewsApp({ Key? key }) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override

Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
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
      initialRoute: '/signup',
      
    );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return const Center(child: CircularProgressIndicator(color: Colors.red,),);
      },
    );
  }









}