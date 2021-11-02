import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:the_news/app/core/theme/app_theme.dart';
import 'package:the_news/app/routes/pages.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "News App Flutter", 
      debugShowCheckedModeBanner: false,
      theme : appTheme() ,
      getPages: AddPages.pages,
      initialRoute: '/signup',
      
    );
  }
}
