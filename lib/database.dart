import 'package:hive/hive.dart';

part 'database.g.dart';

@HiveType(typeId: 1)
class Database {
  Database({required this.name,required this.currentIndex,required this.favoritedb });
  @HiveField(0)
  String name;

  @HiveField(1)
  int currentIndex;

  @HiveField(2)
  List<String> favoritedb;
}