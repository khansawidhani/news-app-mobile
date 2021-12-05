import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/article.dart';
import 'package:news_app_flutter/app/data/repository/news_repo.dart';

class Controller extends GetxController {
  NewsRepository? newsRepo;
  // List categories = homeController.tabs.map((e) => e.text).toList();
  @override
  void onInit() {
    super.onInit();
    newsRepo = Get.find<NewsRepository>();
    getNewsByGeneralCategory();
    getNewsByScienceCategory();
    getNewsBySportsCategory();
    getNewsByTechnologyCategory();
    getNewsByHealthCategory();
    getNewsByFashionCategory();
    getNewsByEntertainmentCategory();
  }

  Future<List<Article>> getNewsByGeneralCategory() async {
    try {
      var result = await newsRepo!.getNewsByCategory('general');
      if (result.isNotEmpty) {
        RxList<Article> articles = result.obs;
        return articles;
      } else {
        throw Exception('No articles found');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Article>> getNewsByScienceCategory() async {
    try {
      var result = await newsRepo!.getNewsByCategory('science');
      if (result.isNotEmpty) {
        RxList<Article> articles = result.obs;
        return articles;
      } else {
        throw Exception('No articles found');
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  getNewsBySportsCategory() async {
    try {
      var result = await newsRepo!.getNewsByCategory('sports');
      if (result.isNotEmpty) {
        RxList<Article> articles = result.obs;
        return articles;

      } else {
        throw Exception('No articles found');

      }
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
      Future<List<Article>> getNewsByTechnologyCategory()async{
    try{
      var result = await newsRepo!.getNewsByCategory('technology');
  if(result.isNotEmpty){
  RxList<Article> articles = result.obs;
        return articles;
  }
  else{
        throw Exception('No articles found');

  }
    }on Exception catch (e){
      throw Exception(e);

      }

      }

      Future<List<Article>> getNewsByHealthCategory()async{
    try{
      var result = await newsRepo!.getNewsByCategory('health');
  if(result.isNotEmpty){
  RxList<Article> articles = result.obs;
        return articles;
  }
  else{
        throw Exception('No articles found');
  }
    }on Exception catch (e){
      throw Exception(e);

      }

      }

      Future<List<Article>> getNewsByFashionCategory()async{
    try{
      var result = await newsRepo!.getNewsByCategory('fashion');
  if(result.isNotEmpty){
  RxList<Article> articles = result.obs;
        return articles;
  }
  else{
        throw Exception('No articles found');
  }
    }on Exception catch (e){
      throw Exception(e);
      }

      }

      Future<List<Article>> getNewsByEntertainmentCategory()async{
    try{
      var result = await newsRepo!.getNewsByCategory('entertainment');
  if(result.isNotEmpty){
  RxList<Article> articles = result.obs;
  return articles;
  }
  else{
        throw Exception('No articles found');
  }
    }on Exception catch (e){
      throw Exception(e);

      }

      }

}
