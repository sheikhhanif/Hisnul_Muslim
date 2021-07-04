import 'package:flutter/material.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:audioplayers/audioplayers.dart';

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
            (context, index) => Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      duas?[index].arDua ?? '',
                      style: TextStyle(
                        fontFamily: 'quran',
                        fontSize: 35,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColorLight,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                        icon: Icon(Icons.play_arrow_outlined),
                        onPressed: () async {
                          await locator<AudioPlayer>().play(
                              'https://www.hisnulmuslim.com/audio/${duas?[index].id}');
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      duas?[index].enTranslation ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
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
