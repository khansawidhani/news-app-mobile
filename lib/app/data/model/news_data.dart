import 'package:news_app_flutter/app/data/model/article.dart';

class NewsData {
  NewsData(
      {required this.status,
      required this.totalResults,
      required this.articles});
  String status;
  int totalResults;
  List<Article> articles;
  factory NewsData.fromJson(Map<String, dynamic> data) {
    final status = data['status'] as String;
    final totalResults = data['totalResults'] as int;
    final articlesData = data['articles'] as List<dynamic>;
    final articles = articlesData.isNotEmpty ? articlesData
            .map((articleData) => Article.fromJson(articleData))
            .toList()
        : <Article>[]
        ;
        // print("Articles from Modal : $articles");
    return NewsData(
        status: status, totalResults: totalResults, articles: articles);
  }
}