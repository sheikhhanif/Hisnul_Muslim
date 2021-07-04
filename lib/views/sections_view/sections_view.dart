import 'package:flutter/material.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:hisnulmuslim/views/dua_groups_view/dua_groups_view.dart';
import 'package:hisnulmuslim/widgets/loading_view.dart';

class SectionsView extends StatelessWidget {
  const SectionsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Section>>(
        future: locator<AzkarDao>().getAllSections(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingView();

          final List<Section>? list = snapshot.data;
          return ListView.separated(
              itemCount: list?.length ?? 0,
              separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => DuaGroupView(
                        id: list?[index].id ?? 0,
                        isCategory: true,
                        title: list?[index].enTitle ?? '',
                      ),
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: kPrimaryColorLight,
                    ),
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 24),
                          child: Image.asset(
                            'assets/images/sections/${list?[index].image}',
                            color: Colors.red,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                            child: Text(
                          list?[index].enTitle ?? '',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: kAccentColor,
                              fontSize: 18),
                        ))
                      ],
                    ),
                  ),
                );
              });
        });
  }
}
