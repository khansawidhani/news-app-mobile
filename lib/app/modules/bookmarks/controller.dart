// ignore_for_file: unused_import, prefer_is_empty

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_flutter/app/data/model/article.dart';
import 'package:news_app_flutter/app/data/model/article_hive.dart';
import 'package:news_app_flutter/app/data/model/boxes.dart';

class BookmarksController extends GetxController{

  @override
  void dispose(){
    Hive.close();
    super.dispose();
  }
  RxBool? isFavourite;
  Box<HiveArticle> articleBox = Boxes.getArticles();



  // showLoadingFavourites(){
  //   isLoadingFavourites.toggle();
  // }
  // hideLoadingFavourites(){
  //   isLoadingFavourites.toggle();
  // }
  getBookmarks()async{
    try{
      // showLoadingFavourites();
      // final result = Boxes.getArticles();
      // // hideLoadingFavourites();
      // if(result.isNotEmpty){
      //    bookmarks = result;
      //   print(bookmarks);
      //   return bookmarks;
      // } else{
      //   print("No Favourite  articles found");
      // }
      update();
    }
    on Exception catch(e){
      throw Exception(e);
      }
  }
  
  isFavourte(title, HiveArticle article){
  
  var test = articleBox.values.where((element) => element.title == title);
  List<HiveArticle> bookmarks = test.toList();
  if(bookmarks.length < 1){
    articleBox.add(article);
    Get.snackbar("", "added to bookmarks");
  }
  else{
    articleBox.delete(article.key);
    Get.snackbar("", "removed from bookmarks", snackPosition: SnackPosition.BOTTOM, backgroundColor: const Color(0xff121212), colorText: Colors.white);
  }
  update();

  // print('test = $test');
  // if(bookmarks.isEmpty){
  //   print('nothing found');
  // }

  // else{
  //   print('articles found ${bookmarks[0].title}');
  // }
  }
}