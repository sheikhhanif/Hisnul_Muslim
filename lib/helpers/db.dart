import 'dart:io';

import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/models/category_model.dart';
import 'package:hisnulmuslim/models/dua_group_model.dart';
import 'package:hisnulmuslim/models/dua_model.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as p;

part 'db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app.db'));
    if (!await file.exists()) {
      // Extract the pre-populated datbaase file from assets
      final data = await rootBundle.load('assets/db/app.db');
      await file.writeAsBytes(
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
    }

    return VmDatabase(file);
  });
}

@UseMoor(tables: [Categories, DuaGroups, Duas], daos: [AzkarDao])
class Db extends _$Db {
  Db() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}
