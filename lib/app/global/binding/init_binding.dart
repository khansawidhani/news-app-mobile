import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/repository/news_repo.dart';
import 'package:news_app_flutter/app/global/controller/news_controller.dart';
import 'package:news_app_flutter/app/global/controller/news_helper.dart';
import 'package:news_app_flutter/app/modules/bookmarks/controller.dart';
import 'package:news_app_flutter/app/modules/dashboard/controller.dart';
import 'package:news_app_flutter/app/modules/home/category_controller.dart';
import 'package:news_app_flutter/app/modules/home/category_news.dart';
import 'package:news_app_flutter/app/modules/home/controller.dart';
import 'package:news_app_flutter/app/modules/news/controller.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(NewsRepository());
    Get.put(Controller());
    Get.put(HomeController());
    Get.put(NewsController());
    Get.put(NewsHelper());
    Get.put(BookmarksController());
    Get.put(NewsScreenController());

  }

}