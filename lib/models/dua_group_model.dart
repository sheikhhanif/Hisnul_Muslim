import 'package:moor/moor.dart';

@DataClassName("DuaGroup")
class DuaGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get arTitle => text().nullable()();
  TextColumn get enTitle => text().nullable()();
  TextColumn get bnTitle => text().nullable()();
  IntColumn get categoryId => integer().nullable()();
  BoolColumn get isBookmark => boolean().withDefault(const Constant(false))();

  @override
  String? get tableName => 'Dua_Group';
}
