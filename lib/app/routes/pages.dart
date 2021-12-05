import 'package:get/route_manager.dart';
import 'package:news_app_flutter/app/modules/dashboard/binding.dart';
import 'package:news_app_flutter/app/modules/dashboard/view.dart';
import 'package:news_app_flutter/app/modules/favourites/binding.dart';
import 'package:news_app_flutter/app/modules/favourites/view.dart';
import 'package:news_app_flutter/app/modules/home_page/binding.dart';
import 'package:news_app_flutter/app/modules/home_page/view.dart';
import 'package:news_app_flutter/app/modules/user_auth/login/view.dart';
import 'package:news_app_flutter/app/modules/user_auth/signup/view.dart';
import 'package:news_app_flutter/app/routes/routes.dart';

class AddPages{
  static final pages = [
    GetPage(name: Routes.home, page: ()=> HomePage(), binding: HomeBinding()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.signup, page: () => SignupScreen()),
    GetPage(name: Routes.favourites, page: () => Favourites(), binding: BookmarksBinding()),
    GetPage(name: Routes.dashboard, page: () => Dashboard(), binding: DashboardBinding()),

    

  ];
}