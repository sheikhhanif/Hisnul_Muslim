import 'package:moor/moor.dart';

@DataClassName("Category")
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get image => text().nullable()();
  TextColumn get enTitle => text().nullable()();
  TextColumn get bnTitle => text().nullable()();

  @override
  String? get tableName => 'Category';
}
