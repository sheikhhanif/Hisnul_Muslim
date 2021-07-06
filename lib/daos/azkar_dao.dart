import 'package:hisnulmuslim/helpers/db.dart';

import 'package:hisnulmuslim/models/category_model.dart';
import 'package:hisnulmuslim/models/dua_group_model.dart';
import 'package:hisnulmuslim/models/dua_model.dart';
import 'package:moor/moor.dart';
part "azkar_dao.g.dart";

@UseDao(tables: [Categories, DuaGroups, Duas])
class AzkarDao extends DatabaseAccessor<Db> with _$AzkarDaoMixin {
  AzkarDao(Db db) : super(db);

  Future<List<Category>> getAllCategories() async {
    return select(categories).get();
  }

  Future<List<DuaGroup>> getDuaGroupsByCategoryId(int id) async {
    return (select(duaGroups)..where((tbl) => tbl.categoryId.equals(id))).get();
  }

  Future<DuaGroup> getDuaGroupsTitleByDuaId(int id) async {
    return (select(duaGroups)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  Future<List<DuaGroup>> searchInDuaGroup(String str) async {
    final List<DuaGroup> list = [];
    final enList = await (select(duaGroups)
          ..where((tbl) => tbl.enTitle.like('%$str%')))
        .get();
    final arList = await (select(duaGroups)
          ..where((tbl) => tbl.arTitle.like('%$str%')))
        .get();

    final bnList = await (select(duaGroups)
          ..where((tbl) => tbl.bnTitle.like('%$str%')))
        .get();
    list..addAll(enList)..addAll(arList)..addAll(bnList);
    return list;
  }

  Future<List<Dua>> searchInDua(String str) async {
    final List<Dua> list = [];
    final enList = await (select(duas)
          ..where((tbl) => tbl.enTranslation.like('%$str%')))
        .get();
    final arList =
        await (select(duas)..where((tbl) => tbl.arDua.like('%$str%'))).get();

    final bnList = await (select(duas)
          ..where((tbl) => tbl.bnTranslation.like('%$str%')))
        .get();
    list..addAll(enList)..addAll(arList)..addAll(bnList);
    return list;
  }

  Future<int> getDuaGroupLength() async {
    var res = await select(duaGroups).get();
    return res.length;
  }

  Future<List<DuaGroup>> getAllDuaGroups() {
    return select(duaGroups).get();
  }

  Future<List<Dua>> getDuaByGroupId(int id) async {
    return (select(duas)..where((tbl) => tbl.groupId.equals(id))).get();
  }

  Future<Category>? getCategoryByDuaGroupId(int id) {
    return (select(categories)..where((tbl) => tbl.id.equals(id))).getSingle();
  }

  void updateDuaFavourite(Dua dua) {
    update(duas).replace(dua);
  }

  Future<List<Dua>> getFavouritesDua() {
    return (select(duas)..where((tbl) => tbl.fav.equals(true))).get();
  }

  Future<bool> getIsFavouriteDua(int id) async {
    var dua =
        await (select(duas)..where((tbl) => tbl.id.equals(id))).getSingle();
    return dua.fav;
  }

  void updateDuaGroupBookmark(DuaGroup duaGroup) {
    update(duaGroups).replace(duaGroup);
  }

  Stream<List<DuaGroup>> getBookmarkedDuaGroup() {
    return (select(duaGroups)..where((tbl) => tbl.isBookmark.equals(true)))
        .watch();
  }

  Future<bool> getIsBookMarkedDuaGroup(int id) async {
    var dua = await (select(duaGroups)..where((tbl) => tbl.id.equals(id)))
        .getSingle();
    return dua.isBookmark;
  }
}
