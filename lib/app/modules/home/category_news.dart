import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter/app/data/model/article.dart';
import 'package:news_app_flutter/app/global/controller/news_controller.dart';
import 'package:news_app_flutter/app/global/widgets/article_photo.dart';
import 'package:news_app_flutter/app/global/widgets/text_utils.dart';
import 'package:news_app_flutter/app/modules/home/category_controller.dart';

class ArticleList extends StatelessWidget {
final List<Article> articles;

  ArticleList({ Key? key, required this.articles}) : super(key: key);
final controller = Get.find<Controller>();
final newsController = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) { 
    return 
    ListView.builder(
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
                                      newsController.getPublishedAt(article.publishedAt),
                                      // article.publishedAt,
                                      style: publishedAtTextStyle(),
                                    ),
                                  ),
                                  IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: (){},
                                      icon: const Icon(
                                        Icons.favorite_outline_outlined,
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
            });
  }
}

class FutureBuild extends StatelessWidget {
  final Future method;
  const FutureBuild({ Key? key, required this.method}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print('getting into future build');
    return FutureBuilder
    (
      future: method,
      builder: (
        BuildContext context, 
        AsyncSnapshot snapshot){
        if(snapshot.hasData){
          List<Article> articlesList = snapshot.data!.toList();
          print('Method has data');
          // print("Future articles List $articlesList");
          return ArticleList(articles: articlesList);
        } 
        if(snapshot.hasError){
          return Container();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      );
  }
}