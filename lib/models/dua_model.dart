import 'package:moor/moor.dart';

@DataClassName("Dua")
class Duas extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get groupId => integer().nullable()();
  TextColumn get duaTopEn => text().nullable()();
  TextColumn get duaTopBn => text().nullable()();
  TextColumn get arDua => text().nullable()();

  TextColumn get enTranslation => text().nullable()();
  TextColumn get bnTranslation => text().nullable()();

  TextColumn get enTransliteration => text().nullable()();
  TextColumn get bnTransliteration => text().nullable()();

  TextColumn get duaBottomEn => text().nullable()();
  TextColumn get duaBottomBn => text().nullable()();

  @override
  String? get tableName => 'Dua';
}
