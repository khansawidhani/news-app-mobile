import 'package:get/instance_manager.dart';
import 'package:news_app_flutter/app/data/repository/news_repo.dart';
import 'package:news_app_flutter/app/data/services/http_service.dart';
import 'package:news_app_flutter/app/modules/home_page/controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(HttpService());
    Get.put(NewsRepository());
  }

}