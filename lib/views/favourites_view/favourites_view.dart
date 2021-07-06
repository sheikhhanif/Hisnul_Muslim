import 'package:flutter/material.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:hisnulmuslim/views/dua_view/dua_view.dart';
import 'package:hisnulmuslim/widgets/azkar/dua_groups_item.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  _FavouritesViewState createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {
  List<Dua>? favouritesDua;
  List<DuaGroup>? bookMarkedDuaGroups;

  @override
  void initState() {
    super.initState();
    getFavouritesDua();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: StreamBuilder<List<DuaGroup>>(
          stream: locator<AzkarDao>().getBookmarkedDuaGroup(),
          builder: (context, snapshot) {
            return CustomScrollView(
              slivers: [
                header('MY LISTS'),
                SliverToBoxAdapter(
                  child: favouritesDua == null
                      ? SizedBox()
                      : DuaGroupsItem(
                          title: 'My Fav Duas',
                          list: favouritesDua,
                          icon: Icons.favorite,
                          onPressed: favouritesDua!.isEmpty
                              ? () {}
                              : () async {
                                  await Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) => DuaView(
                                        title: 'My Fav Dua',
                                        sectionTitle: 'My Fav Dua',
                                        id: -1,
                                        duas: favouritesDua,
                                      ),
                                    ),
                                  );
                                  getFavouritesDua();
                                },
                        ),
                ),
                header('BOOKMARKS'),
                if (snapshot.data != null)
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => DuaGroupsItem(
                              id: snapshot.data![index].id,
                              title: snapshot.data![index].enTitle ?? '',
                              icon: Icons.star,
                            ),
                        childCount: snapshot.data!.length),
                  )
              ],
            );
          }),
    );
  }

  Widget header(String title) {
    return SliverToBoxAdapter(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        color: kPrimaryColorLight,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontStyle: FontStyle.italic,
            color: kBrownTextColor,
          ),
        ),
      ),
    );
  }

  void getFavouritesDua() async {
    favouritesDua = await locator<AzkarDao>().getFavouritesDua();
    setState(() {});
  }
}
