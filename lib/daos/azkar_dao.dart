import 'package:hisnulmuslim/helpers/db.dart';

import 'package:hisnulmuslim/models/category_model.dart';
import 'package:hisnulmuslim/models/dua_group_model.dart';
import 'package:hisnulmuslim/models/dua_model.dart';
import 'package:hisnulmuslim/models/section_model.dart';
import 'package:moor/moor.dart';
part "azkar_dao.g.dart";

@UseDao(tables: [Categories, DuaGroups, Sections, Duas])
class AzkarDao extends DatabaseAccessor<Db> with _$AzkarDaoMixin {
  AzkarDao(Db db) : super(db);

  Future<List<Category>> getAllCategories() async {
    return select(categories).get();
  }

  Future<List<DuaGroup>> getDuaGroupsByCategoryId(int id) async {
    return (select(duaGroups)..where((tbl) => tbl.categoryId.equals(id))).get();
  }

  Future<List<Section>> getAllSections() async {
    return select(sections).get();
  }

  Future<List<DuaGroup>> getDuaGroupsBySectionId(int id) async {
    return (select(duaGroups)..where((tbl) => tbl.sectionId.equals(id))).get();
  }

  Future<DuaGroup> getDuaGroupsTitleByDuaId(int id) async {
    return (select(duaGroups)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<List<Dua>> getDuaByGroupId(int id) async {
    return (select(duas)..where((tbl) => tbl.groupId.equals(id))).get();
  }

  Future<int> getDuaGroupLength() async {
    var res = await select(duaGroups).get();

    return res.length;
  }
}
