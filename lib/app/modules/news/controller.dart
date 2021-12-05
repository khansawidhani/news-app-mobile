// ignore_for_file: avoid_print, unused_import

import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/article.dart';

class NewsScreenController extends GetxController {
  // int tabIndex = 0;
  // changeTabIndex(int index){
  //   tabIndex = index;
  //   print("Tab index $tabIndex");
  //   update();
  // }
  // BookmarksRepository? _bookmarksRepo;

  // @override
  // void onReady(){
  //   super.onReady();
  //   _bookmarksRepo = Get.find<BookmarksRepository>();
  //   getBookmarks();
  // }
  // RxBool isLoadingFavourites = false.obs;
  // RxList<Article>? articles;
  RxBool isFavourite = false.obs;
  // showLoadingFavourites(){
  //   isLoadingFavourites.toggle();
  // }
  // hideLoadingFavourites(){
  //   isLoadingFavourites.toggle();
  // }
  // getBookmarks()async{
  //   try{
  //     showLoadingFavourites();
  //     final result = await _bookmarksRepo!.getBookmarks();
  //     hideLoadingFavourites();
  //     if(result.isNotEmpty){
  //       articles = result.obs;
  //     } 
  //     return articles;
  //   }
  //   on Exception catch(e){throw Exception(e);}
  // }
  toggleFavourite(){
    // print("Favourite bool : $isFavourite");
    isFavourite.toggle();
  }
  

}
