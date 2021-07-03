import 'package:flutter/material.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/widgets/azkar/dua_groups_item.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: CustomScrollView(
        slivers: [
          header('MY LISTS'),
          SliverToBoxAdapter(
            child: DuaGroupsItem(
                title: 'My Fav Duas', icon: Icons.favorite, onPressed: () {}),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => DuaGroupsItem(
                    title:
                        'What to say and do when feeling some pain in the body',
                    icon: Icons.favorite,
                    // id: 2,
                    onPressed: () {}),
                childCount: 10),
          ),
          header('BOOKMARKS'),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => DuaGroupsItem(
                  id: null,
                    title: 'What to say and do when ',
                    icon: Icons.star,
                    // count: 2,
                    onPressed: () {}),
                childCount: 10),
          ),
        ],
      ),
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
}
