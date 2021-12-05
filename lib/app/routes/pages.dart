import 'package:get/route_manager.dart';
import 'package:news_app_flutter/app/modules/bookmarks/view.dart';
import 'package:news_app_flutter/app/modules/dashboard/view.dart';
import 'package:news_app_flutter/app/modules/home/view.dart';
import 'package:news_app_flutter/app/modules/news/view.dart';
import 'package:news_app_flutter/app/modules/user_auth/login/view.dart';
import 'package:news_app_flutter/app/modules/user_auth/signup/view.dart';
import 'package:news_app_flutter/app/routes/routes.dart';

class AddPages{

  static final pages = [

    GetPage(name: Routes.home, page: ()=> HomeScreen()),
    GetPage(name: Routes.login, page: () => LoginScreen(),),
    GetPage(name: Routes.signup, page: () => SignupScreen()),
    GetPage(name: Routes.favourites, page: () => BookmarksScreen(), ),
    GetPage(name: Routes.dashboard, page: () => Dashboard(),),
    GetPage(name: Routes.news, page: () => NewsScreen()),

  ];

}