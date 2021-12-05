import 'package:hive/hive.dart';

part 'source_hive.g.dart';

@HiveType(typeId : 0)
class HiveSource extends HiveObject{
  @HiveField(0)
  String? id;
  @HiveField(1)
  String? name;
}