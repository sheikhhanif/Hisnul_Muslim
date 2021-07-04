import 'package:flutter/material.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:hisnulmuslim/widgets/azkar/dua_groups_item.dart';
import 'package:hisnulmuslim/widgets/dua_view/dua_widget.dart';
import 'package:hisnulmuslim/widgets/loading_view.dart';

class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  bool _loading = false;

  List<DuaGroup>? duaGroups;
  List<Dua>? duas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: TextField(
              style: TextStyle(fontSize: 18),
              controller: _controller,
              onSubmitted: (_) => search(),
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    icon: Icon(
                      Icons.search,
                      color: kAccentColor,
                      size: 30,
                    ),
                    onPressed: () => search()),
                suffixIcon: IconButton(
                    padding: EdgeInsets.only(right: 30),
                    icon: Icon(
                      Icons.close,
                      color: kAccentColor,
                      size: 30,
                    ),
                    onPressed: () {
                      _controller.clear();
                      clearSearch();
                    }),
                filled: true,
                hintText: "Search",
                fillColor: kPrimaryColorLight,
                hintStyle: TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          Expanded(
              child: _loading
                  ? LoadingView()
                  : isResultNull
                      ? SizedBox.shrink()
                      : isResultEmpty
                          ? Center(
                              child: Text('There is no result'),
                            )
                          : buildListViews())
        ],
      ),
    );
  }

  void search() async {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _loading = true;
      });
      duaGroups = await locator<AzkarDao>().searchInDuaGroup(text);
      duas = await locator<AzkarDao>().searchInDua(text);

      setState(() {
        _loading = false;
      });
    } else
      clearSearch();
  }

  void clearSearch() {
    setState(() {
      duaGroups = null;
      duas = null;
    });
  }

  bool get isResultNull => duaGroups == null && duas == null;
  bool get isResultEmpty => duaGroups!.isEmpty && duas!.isEmpty;

  Widget buildListViews() {
    return CustomScrollView(
      slivers: [
        header('Items'),
        if (duaGroups != null && duaGroups!.isNotEmpty)
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (_, index) => DuaGroupsItem(
                      title: duaGroups?[index].enTitle ?? '',
                      onPressed: () {},
                      id: duaGroups?[index].id,
                    ),
                childCount: duaGroups!.length),
          ),
        header('Duas'),
        if (duas != null && duas!.isNotEmpty)
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (_, index) => DuaWidget(
                      dua: duas![index],
                    ),
                childCount: duas!.length),
          ),
      ],
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
