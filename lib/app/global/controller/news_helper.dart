// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:news_app_flutter/app/global/controller/news_controller.dart';


class NewsHelper extends GetxController{
  
final newsController = Get.find<NewsController>();
getNewsTitle(int index){
  final title = newsController.articles?[index].title;
  return title;
}
getNewsAuthor(int index){
  final author = newsController.articles?[index].author;
  return author != null ? author.toString() : "Annonynous";
}
getNewsDescription(int index){
  final description = newsController.articles?[index].description;
  return description != null && description.toString().length > 80 ? description.toString().substring(0, 80) + " ..." : "No description available";
}
getPublishedAt(int index){
  final publishedAt = newsController.getPublishedAt(newsController.articles?[index].publishedAt);
  return publishedAt;
}
getNewsImage(int index){
  final urlToImage = newsController.articles?[index].urlToImage;
  print("Helper image url : $urlToImage");
  return urlToImage;
}
getNewsContent(int index){
  final content = newsController.articles![index].content;
  return content != null ? content.toString() : "Content N/A";
}
getNewsUrl(int index){
  final url = newsController.articles?[index].url;
  return url;
}
getNewsSource(int index){
  return newsController.articles?[index].source;
}
getNewsSourceId(int index){
  final sourceId = newsController.articles?[index].source.id;
  return sourceId;  
}
getNewsSourceName(int index){
  final sourceName = newsController.articles?[index].source.name; 
  return sourceName;
}

// getIsBookmarked(int index)async{
//   final article = articles[index];
//   final bookmarksList = await DatabaseHelper.instance.getFavourites();
//   bookmarksList.contains(article) ? print(article) : print("false");
//   return bookmarksList.contains(article);
//   // bookmarksList.map((e){
//   //   identical(article, e) == true ? print("true"): print("false");
//   //   print("done");
//   // });
// }
}