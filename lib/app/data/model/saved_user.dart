import 'package:hive_flutter/adapters.dart';

part 'saved_user.g.dart';

@HiveType(typeId: 2)
class SavedUser extends HiveObject{
  @HiveField(0)
  late String uid;

  @HiveField(1) 
  bool isLoggedin = false ;

 
}