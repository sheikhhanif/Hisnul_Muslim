import 'package:moor/moor.dart';

@DataClassName("Section")
class Sections extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get image => text().nullable()();
  TextColumn get arTitle => text().nullable()();
  TextColumn get enTitle => text().nullable()();
  TextColumn get bnTitle => text().nullable()();

  @override
  String? get tableName => 'Section';
}
