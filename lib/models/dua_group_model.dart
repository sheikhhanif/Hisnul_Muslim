import 'package:moor/moor.dart';

@DataClassName("DuaGroup")
class DuaGroups extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get enTitle => text().nullable()();
  TextColumn get bnTitle => text().nullable()();
  IntColumn get categoryId => integer().nullable()();
  BoolColumn get isBookmark => boolean().withDefault(const Constant(false))();
  TextColumn get enReference => text().nullable()();
  TextColumn get audio => text().nullable()();

  @override
  String? get tableName => 'Dua_Group';
}
