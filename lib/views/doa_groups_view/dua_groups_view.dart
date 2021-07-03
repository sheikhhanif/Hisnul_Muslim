import 'package:flutter/material.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:hisnulmuslim/widgets/azkar/dua_groups_item.dart';
import 'package:hisnulmuslim/widgets/loading_view.dart';

class DuaGroupView extends StatelessWidget {
  const DuaGroupView(
      {Key? key,
      required this.id,
      this.isCategory = false,
      required this.title})
      : super(key: key);
  final int id;
  final bool isCategory;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<DuaGroup>>(
          future: isCategory
              ? locator<AzkarDao>().getDuaGroupsByCategoryId(id)
              : locator<AzkarDao>().getDuaGroupsBySectionId(id),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting)
              return LoadingView();
            final List<DuaGroup>? list = snapshot.data;
            return ListView.builder(
              itemCount: list?.length ?? 0,
              // separatorBuilder: (context, index) => Divider(),
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    DuaGroupsItem(
                      onPressed: () {},
                      icon: Icons.ac_unit,
                      title: list?[index].enTitle ?? '',
                      id: list?[index].id,
                    ),
                    Divider()
                  ],
                );
              },
            );
          }),
    );
  }
}
