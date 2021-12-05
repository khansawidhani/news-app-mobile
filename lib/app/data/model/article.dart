import 'package:hive/hive.dart';
import 'package:news_app_flutter/app/data/model/source.dart';


class Article{
  Article(
      {required this.source,
      this.author,
      required this.title,
      this.description,
      required this.url,
      this.urlToImage,
      required this.publishedAt,
      this.content});
  Source source;
  
  String? author;
  
  String title;
  
  String? description;
  
  String url;
  
  String? urlToImage;
  
  String publishedAt;
  
  String? content;

  factory Article.fromJson(Map<String, dynamic> data) {
    final source = Source.fromJson(data['source']);
    final author = data['author'] as String?;
    final title = data['title'] as String;
    final description = data['description'] as String?;
    final url = data['url'] as String;
    final urlToImage = data['urlToImage'] as String?;
    final publishedAt = data['publishedAt'] as String;
    final content = data['content'] as String?;
    return Article(
        source: source,
        author: author,
        title: title,
        description: description,
        url: url,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content, 
        
        );
  }

  Map<String, dynamic> toJson(){
    return {
      'source' : source.toJson(),
      'author' : author, 
      'title' : title,
      'description' : description,
      'url' : url,
      'urlToImage': urlToImage, 
      'publishedAt' : publishedAt, 
      'content' : content 
    };
  }
}


