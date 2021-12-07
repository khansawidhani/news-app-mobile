// ignore_for_file: avoid_print, unused_import, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/global/controller/news_controller.dart';
import 'package:news_app_flutter/app/global/controller/news_helper.dart';
import 'package:news_app_flutter/app/global/widgets/news_card.dart';
import 'package:news_app_flutter/app/modules/news/controller.dart';

// import 'package:news_app_flutter/app/global_widgets/article_photo.dart';
// import 'package:news_app_flutter/app/global_widgets/news_card.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({Key? key}) : super(key: key);
  final newsController = Get.find<NewsController>();
  final newsHelper = Get.find<NewsHelper>();
  final newsScreenController = Get.find<NewsScreenController>();

  
  @override
  Widget build(BuildContext context) {
    print("getting into HOME");
    // print("Home page Articles : ${newsController.articles.runtimeType}");
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: const Text('Top Headlines'),
          centerTitle: true,
          backgroundColor: Colors.red[800],
        ),
        body: Obx((){
          return newsController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                // color: Colors.red[100],
                child: ListView.builder(itemBuilder: (context, index) {
                  // if(newsController.articles!.isNotEmpty){
                  return Container(
                    
                padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                    child: newsCard(
                      index,
                      context,
                      newsController.articles?[index].urlToImage,
                      newsHelper.getNewsAuthor(index),
                      newsHelper.getNewsTitle(index),
                      newsHelper.getNewsDescription(index),
                      newsHelper.getPublishedAt(index),
                      newsHelper.getNewsUrl(index),
                      newsHelper.getNewsContent(index),
                      newsHelper.getNewsSource(index),
                      newsScreenController.isFavourite,
                      newsScreenController.toggleFavourite()));

                  // }
                  // else{
                  //   return const Center(child: Text("No articles found"));
                  // }
                }),
              );
        })
    
    
           
        
        );
  }
}

















