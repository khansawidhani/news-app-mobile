// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/article.dart';
import 'package:news_app_flutter/app/data/repository/news_repo.dart';

class HomeController extends GetxController {
  NewsRepository? newsRepo;
  @override
  void onReady() {
    super.onReady();
    newsRepo = Get.find<NewsRepository>();
    loadTopHeadlines();
    
  }
  RxBool isLoading = false.obs;
  RxList<Article>? articles;
  Future<List<Article>> loadTopHeadlines() async {
    try {
      showLoading();
      final result = await newsRepo!.getTopHeadlines();
      hideLoading();
      if (result.isNotEmpty) {
        articles = result.obs;

      }
      print("Articles: ${articles![0].title}");
      return articles!;
    } on Exception catch (error) {
      print(error);
      throw Exception(error);
    }
  }
  showLoading(){
    isLoading.toggle();
  }
  hideLoading(){
    isLoading.toggle();
  }
}
