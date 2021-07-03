import 'package:moor/moor.dart';

@DataClassName("Dua")
class Duas extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get arDua => text().nullable()();
  TextColumn get enTranslation => text().nullable()();
  TextColumn get bnTranslation => text().nullable()();
  TextColumn get arReference => text().nullable()();
  TextColumn get enReference => text().nullable()();
  IntColumn get groupId => integer().nullable()();
  BoolColumn get fav => boolean()();
  @override
  String? get tableName => 'Dua';
}
