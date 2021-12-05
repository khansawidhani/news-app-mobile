
// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/article.dart';
import 'package:news_app_flutter/app/data/repository/news_repo.dart';

class NewsController extends GetxController {
  NewsRepository? newsRepo;
  
  @override
  void onInit() {
    super.onInit();
    newsRepo = Get.find<NewsRepository>();
    getTopHeadlines();
    
    // print("Controller on Ready : $articles");
  }

  RxBool isLoading = false.obs;
  RxList<Article>? articles;

  // Toggle Api waiting loader
  showLoading() {
    // print("ShowLoading : $isLoading");
    isLoading.toggle();
  }

  hideLoading() {
    // print("hideLoading : $isLoading");
    isLoading.toggle();
  }

  // Get top news
  getTopHeadlines() async {
    try {
      showLoading();
      final result = await newsRepo!.getTopHeadlines();
      hideLoading();
      if(result.isNotEmpty){
        articles = result.obs;
        // print("News Controller Articles : $articles");
        return articles;
      } else {
        print("No articles found");
        return Center(child: Text('No Articles found '),);
      }
    } on Exception catch (error) {
      print(error);
      throw Exception(error);
    }
  }

  // Date time handler
  getPublishedAt(publishedAt) {
    DateTime currentTime = DateTime.now();
    DateTime time = DateTime.parse(publishedAt);
    final diff = currentTime.difference(time);
    if (diff.inSeconds < 5) {
      //  print(diff.inSeconds);
      return "Just now";
    } else if (diff.inSeconds < 60) {
      //  print(diff.inSeconds);
      return diff.inSeconds.toString() + " seconds ago";
    } else if (diff.inMinutes < 60) {
      //  print(diff.inMinutes);
      return diff.inMinutes.toString() + " minutes ago";
    } else if (diff.inHours < 24) {
      //  print(diff.inHours);
      return diff.inHours.toString() + " hours ago";
    } else if (diff.inDays < 30) {
      //  print(diff.inDays);
      return diff.inDays.toString() + " days ago";
    } else {
      return time.toString();
    }
  }



}
