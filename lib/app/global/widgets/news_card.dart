// ignore_for_file: avoid_print, unused_local_variable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/article_hive.dart';
import 'package:news_app_flutter/app/data/model/source.dart';
import 'package:news_app_flutter/app/data/model/source_hive.dart';
import 'package:news_app_flutter/app/global/widgets/text_utils.dart';
import 'package:news_app_flutter/app/global/widgets/utils.dart';
import 'package:news_app_flutter/app/modules/bookmarks/controller.dart';
import 'package:news_app_flutter/app/modules/news/controller.dart';

import 'article_photo.dart';

final homeController = Get.find<NewsScreenController>();
final bookmarkController = Get.find<BookmarksController>();
newsCard(
    int index,
    BuildContext context,
    String? urlToImage,
    String author,
    String title,
    String description,
    String publishedAt,
    String url,
    String content,
    Source source,
    RxBool isFavourite,
    toggleFavourite) {
  return Card(
    child: Column(
      children: [
        Container(
            padding: const EdgeInsets.all(3.0),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                child: articlePhoto(urlToImage, context))),
        Container(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              author.length > 80 ? author.substring(0, 80) + " ..." : author,
              // author != null ? author.toString() : "Anonymous ",
              style: authorTextStyle(),
            ),
            Text(
              title.toString(),
              style: headingTextStyle(),
            ),
            spacer(10.0),
            Text(
              description.length > 150 ? description.substring(0, 150) + " ..." : description,
              // description != null ? description.toString() : "Not Available",
              style: descriptionTextStyle(),
            ),
            // spacer(10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  publishedAt,
                  style: publishedAtTextStyle(),
                ),
                IconButton(
                    onPressed: () async {
                      print(index);
                      HiveSource hiveSource = HiveSource()
                      ..id = source.id 
                      ..name = source.name;
                      HiveArticle article = HiveArticle()
                      ..title = title
                      ..description = description 
                      ..author = author 
                      ..urlToImage = urlToImage 
                      ..url = url 
                      ..content = content 
                      ..source = hiveSource 
                      ..publishedAt = publishedAt;
                      var bookmarks = bookmarkController.isFavourte(title, article);
                      // if(bookmarks.length < 1){
                        

                      // await bookmarkController.articleBox.add(article);
                      

                      // }
                      // else{
                      //   // Get.snackbar("error", "already exist", snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.blueGrey[50], colorText: Colors.black);
                      //   bookmarkController.articleBox.delete(article.key);
                        
                      // }

                      // final articleBox = Boxes.getArticles();

                      // bool isExist = false;
                      // if(articleBox.values.firstWhere((element) => element.title == title ).isInBox){
                        
                      // }
                      //  bool isExist = ;
                      //  print(isExist? 'found' : 'not found');
                       

                      // 
                      // if(articleBox.values.contains(article)){
                      //   print('article found');
                      // }
                      // else{
                      //   print('article not found');
                      // }


                       

                      // bool checkFavourite(){
                      //   articleBox.values.where((element){
                      //     if(
                      //       element.title == title && 
                      // element.author == author && 
                      // element.description == description && 
                      // element.urlToImage == urlToImage &&
                      // element.url == url
                      // && element.content == content
                      //     ){
                      //       print(element.title);
                      //       return true;
                      //     }


                      //   }
                      //  );
                      // }
                      // if(checkFavourite() == true){
                      //   Get.snackbar('error', 'Article(s) already exist in Bookmarks');
                      // }
                      // else{
                      //   
                      // await articleBox.add(article);

                      // }

                    },
                    icon: const Icon(
                      // homeController.isFavourite.isTrue
                      //     ? Icons.favorite
                      //     : 
                          Icons.favorite_border,
                      color: Colors.red,
                      size: 20.0,
                    ))
              ],
            ),
            // spacer(10.0),
          ]),
        )
      ],
    ),
  );
}
