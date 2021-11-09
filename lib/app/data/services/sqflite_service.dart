import 'dart:io';
import 'dart:core';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();
  Future<Database> _initDatabase() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path + "thenewsApp.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  } 
  Future _onCreate(Database db, int version) async{
    await db.execute('''
      CREATE TABLE theNewsBookmarks(
        id INTEGER PRIMARY KEY NOT NULL UNIQUE AUTOINCREMENT,
        title TEXT,
        author TEXT, 
        description, 
        timestamp, 
        isFavourite, 
        content, 
        urlToImage,
        url, 
        source


        
      '''
      );
  }
}