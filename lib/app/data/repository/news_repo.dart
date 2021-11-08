import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/article.dart';
import 'package:news_app_flutter/app/data/services/http_service.dart';

class NewsRepository{
  HttpService? httpService;
  NewsRepository(){
    httpService = Get.put(HttpService());
    httpService!.config();
  }
  Future<List<Article>> getTopHeadlines() async{
    try{
      final response = await httpService!.getRequest('/v2/top-headlines?country=us&category=business');
      final parsedResponse = NewsData.fromJson(response.data);
      return parsedResponse.articles;
    }on Exception catch(error){
      throw Exception(error);
    }
  }
}