// ignore_for_file: unused_import

import 'package:hive/hive.dart';
import 'package:news_app_flutter/app/data/model/source.dart';
import 'package:news_app_flutter/app/data/model/source_hive.dart';

part 'article_hive.g.dart';

@HiveType(typeId: 1)
class HiveArticle extends HiveObject{
  @HiveField(0)
  late HiveSource source;
  @HiveField(1)
  late String? author;
  @HiveField(2)
  late String title;
  @HiveField(3)
  late String? description;
  @HiveField(4)
  late String url;
  @HiveField(5)
  late String? urlToImage;
  @HiveField(6)
  late String publishedAt;
  @HiveField(7)
  late String? content;
}

