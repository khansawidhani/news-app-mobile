import 'package:get/route_manager.dart';
import 'package:the_news/app/modules/home_page/view.dart';
import 'package:the_news/app/modules/user_auth/login/view.dart';
import 'package:the_news/app/modules/user_auth/signup/view.dart';
import 'package:the_news/app/routes/routes.dart';

class AddPages{
  static final pages = [
    GetPage(name: Routes.home, page: ()=> HomePage()),
    GetPage(name: Routes.login, page: () => LoginScreen()),
    GetPage(name: Routes.signup, page: () => SignupScreen())
  ];
}