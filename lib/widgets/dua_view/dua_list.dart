import 'package:flutter/material.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:audioplayers/audioplayers.dart';

import 'dua_widget.dart';

class DuaListView extends StatefulWidget {
  DuaListView({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  _DuaListViewState createState() => _DuaListViewState();
}

class _DuaListViewState extends State<DuaListView> {
  List<Dua>? duas;
  @override
  void initState() {
    super.initState();
    getDuaDetails();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => DuaWidget(dua: duas![index]),
            childCount: duas?.length ?? 0,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) => Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  duas?[index].enReference ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: kBrownTextColor,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            childCount: duas?.length ?? 0,
          ),
        )
      ],
    );
  }

  void getDuaDetails() async {
    duas = await locator<AzkarDao>().getDuaByGroupId(widget.id);
    setState(() {});
  }
}

