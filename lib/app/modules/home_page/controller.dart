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
  loadTopHeadlines() async {
    try {
      showLoading();
      final result = await newsRepo!.getTopHeadlines();
      hideLoading();
      if (result.isNotEmpty) {
        articles = result.obs;
      }
      else{
        print("No articles found");
      }
      print(articles.runtimeType);
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
  getPublishedAt(publishedAt){
    DateTime currentTime = DateTime.now();
   DateTime time = DateTime.parse(publishedAt);
   final diff = currentTime.difference(time);
   if(diff.inSeconds < 5 ){
    //  print(diff.inSeconds);
     return "Just now";
   }
   else if(diff.inSeconds < 60){
    //  print(diff.inSeconds);
     return diff.inSeconds.toString()+" seconds ago";
   }
   else if(diff.inMinutes < 60){
    //  print(diff.inMinutes);
     return diff.inMinutes.toString() + " minutes ago";
   }
   else if(diff.inHours < 24){
    //  print(diff.inHours);
     return diff.inHours.toString() + " hours ago";
   }
   else if(diff.inDays < 30){
    //  print(diff.inDays);
     return diff.inDays.toString() + " days ago";
   }
   else{
     return time.toString();
   }
   
  }
}
