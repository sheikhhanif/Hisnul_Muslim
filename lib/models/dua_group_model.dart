import 'package:moor/moor.dart';

@DataClassName("DuaGroup")
class DuaGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get arTitle => text().nullable()();
  TextColumn get enTitle => text().nullable()();
  TextColumn get bnTitle => text().nullable()();
  IntColumn get categoryId => integer().nullable()();
  IntColumn get sectionId => integer().nullable()();

  @override
  String? get tableName => 'Dua_Group';
}
