import 'package:flutter/material.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:hisnulmuslim/widgets/azkar/dua_groups_item.dart';
import 'package:hisnulmuslim/widgets/loading_view.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DuaGroup>>(
        future: locator<AzkarDao>().getAllDuaGroups(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingView();

          final List<DuaGroup>? list = snapshot.data;
          return ListView.separated(
              itemCount: list?.length ?? 0,
              separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemBuilder: (context, index) {
                return DuaGroupsItem(
                  title: list?[index].enTitle ?? '',
                  id: list?[index].id,
                );
              });
        });
  }
}
