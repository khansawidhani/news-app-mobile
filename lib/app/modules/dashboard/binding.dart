// ignore_for_file: unused_import

import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:news_app_flutter/app/data/repository/news_repo.dart';
import 'package:news_app_flutter/app/global/controller/news_controller.dart';
import 'package:news_app_flutter/app/global/controller/news_helper.dart';
import 'package:news_app_flutter/app/modules/dashboard/controller.dart';
import 'package:news_app_flutter/app/modules/home/controller.dart';
import 'package:news_app_flutter/app/modules/news/controller.dart';
import 'package:news_app_flutter/app/modules/user_auth/controller.dart';

class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    
    Get.put(DashboardController());
    Get.put(NewsRepository());
    Get.put(NewsController());
    Get.put(NewsHelper());
    Get.put(NewsScreenController());
    Get.put(HomeController());
    // Get.put(AuthController());
  

  }

}