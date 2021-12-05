import 'package:hive/hive.dart';
import 'package:news_app_flutter/app/data/model/article_hive.dart';
import 'package:news_app_flutter/app/data/model/saved_user.dart';


class Boxes{
  static Box<HiveArticle> getArticles() => Hive.box<HiveArticle>('articles');
  static Box<SavedUser> getLocalUser() => Hive.box<SavedUser>('localUser');
}