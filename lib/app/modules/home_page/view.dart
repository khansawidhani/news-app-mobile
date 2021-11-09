import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/article.dart';
import 'package:news_app_flutter/app/global_widgets/article_photo.dart';
import 'package:news_app_flutter/app/global_widgets/news_card.dart';
// import 'package:news_app_flutter/app/global_widgets/article_photo.dart';
// import 'package:news_app_flutter/app/global_widgets/news_card.dart';
import 'package:news_app_flutter/app/global_widgets/text_utils.dart';
import 'package:news_app_flutter/app/global_widgets/utils.dart';
import 'package:news_app_flutter/app/modules/home_page/controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    print("getting into HOME");
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: AppBar(
          title: const Text('The News'),
          centerTitle: true,
          backgroundColor: Colors.red[800],
        ),
        body: Obx(() {
          return homeController.isLoading.isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(itemBuilder: (context, index) {
                  // if(homeController.articles!.length.isGreaterThan(0)){
                  final articles = homeController.articles!;
                  final title = articles[index].title;
                  final urlToImage = articles[index].urlToImage;
                  final author = articles[index].author;
                  final getDescription = articles[index].description;
                  String description = getDescription!.length >= 90
                      ? getDescription.substring(0, 90) + " ..."
                      : getDescription;
                  final publishedAt = articles[index].publishedAt;
                  final getPublishedAt =
                      homeController.getPublishedAt(publishedAt);
                  final RxBool isFavourite = homeController.isFavourite;
                  final toggleFavourite = homeController.toggleFavourite;
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5.0),
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25.0)),
                        child: newsCard(context, urlToImage, author, title,
                            description, getPublishedAt, isFavourite, toggleFavourite)),
                  );
                  // }
                  // return Center(child: CircularProgressIndicator(),);
                  // print("Published At $publishedAt");
                  // print("Get published At $getPublishedAt");
                });
        }));
  }
}
