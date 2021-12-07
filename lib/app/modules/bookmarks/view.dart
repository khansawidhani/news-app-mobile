// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app_flutter/app/data/model/article_hive.dart';
import 'package:news_app_flutter/app/data/model/boxes.dart';
import 'package:news_app_flutter/app/global/widgets/article_photo.dart';
import 'package:news_app_flutter/app/global/widgets/text_utils.dart';
import 'package:news_app_flutter/app/modules/bookmarks/controller.dart';

class BookmarksScreen extends StatelessWidget {
  BookmarksScreen({Key? key}) : super(key: key);
  final bookmarksController = Get.find<BookmarksController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.3),
        appBar: AppBar(
          title: const Text("Bookmarked Articles"),
          backgroundColor: Colors.red.shade800,
          
        ),
        body: ValueListenableBuilder<Box<HiveArticle>>(
          valueListenable: Boxes.getArticles().listenable(),
          builder: (context, articleBox, _) {
            final bookmarks = articleBox.values.toList().cast<HiveArticle>();
            return buildBookmarksList(bookmarks);
          },
        ));
  }

  Widget buildBookmarksList(List<HiveArticle> articles) {
    if (articles.isEmpty) {
      return const Center(
        child: Text(
          'No bookmarks yet',
          style: TextStyle(fontSize: 24),
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
            itemCount: articles.length,
            itemBuilder: (context, index) {
              final article = articles[index];
              return GestureDetector(
                child: Container(
                  padding: const EdgeInsets.only(top:0), 
                  decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Card(
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                            child: Container(
                                width: 110,
                                height: 110,
                                child: articlePhoto(article.urlToImage, context))),
                        // const SizedBox(
                        //   width: 5,
                        // ),
                        Expanded(
                            child: Container(
                              // height: 100,
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                              article.author != null
                                  ? article.author.toString()
                                  : "Annonynous",
                              style: authorTextStyle(),
                              ),
                              const SizedBox(height: 5.0),
                              Text(
                              article.title.length > 70
                                  ? article.title.substring(0, 65) + " ..."
                                  : article.title,
                              style: headingTextStyle(),
                              ),
                  
                                ],
                              ), 
                              
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Text(
                                      article.publishedAt,
                                      style: publishedAtTextStyle(),
                                    ),
                                  ),
                                  IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () async {
                                        bookmarksController.articleBox
                                            .delete(article.key);
                                      },
                                      icon: const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                        size: 20.0,
                                      ))
                                ],
                              ),
                          ],
                        ),
                            ))
                      ],
                    ),
                  ),
                ),
              );
            }),
      );
    }
  }

  headingTextStyle() {
    return GoogleFonts.breeSerif(
      color: Colors.black,
      height: 1.0,
      fontSize: 15,
    );
  }

  authorTextStyle() {
    return GoogleFonts.robotoSlab(
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      color: Colors.red[700],
    );
  }
}
