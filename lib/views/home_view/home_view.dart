import 'package:flutter/material.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/views/categories_view/categories_view.dart';
import 'package:hisnulmuslim/views/drawer_view/drawer_view.dart';
import 'package:hisnulmuslim/views/favourites_view/favourites_view.dart';
import 'package:hisnulmuslim/views/search_view/search_view.dart';
import 'package:hisnulmuslim/views/sections_view/sections_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  final List<Widget> views = [
    CategoriesView(),
    SectionsView(),
    FavouritesView(),
    SearchView(),
  ];

  int? _selectedIndex = 0;

  late final TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 4, vsync: this);
    _controller.animation
      ?..addListener(() {
        if (_selectedIndex != (_controller.animation?.value)?.round())
          setState(() {
            _selectedIndex = (_controller.animation?.value)?.round();
          });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerView(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        title: Text('حصن المسلم - Dua'),
      ),
      body: Column(
        children: [
          buildTapBar(),
          Expanded(
            child: TabBarView(
              children: views,
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTapBar() {
    return Container(
      margin: EdgeInsets.fromLTRB(60,15,60,2),
      child: TabBar(
        indicator: BoxDecoration(
          color: kPrimaryColorLight,
        ),
        tabs: [
          Tab(
            child: Icon(
              Icons.home_outlined,
              color:
                  _selectedIndex == 0 ? kAccentColor : const Color(0XFFbdb29f),
            ),
          ),
          Tab(
            child: Text(
              'LISTS',
              style: TextStyle(
                  color: _selectedIndex == 1
                      ? kAccentColor
                      : const Color(0XFFbdb29f),
                  fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            child: Icon(
              Icons.star_outline,
              color:
                  _selectedIndex == 2 ? kAccentColor : const Color(0XFFbdb29f),
            ),
          ),
          Tab(
            child: Icon(
              Icons.search,
              color:
                  _selectedIndex == 3 ? kAccentColor : const Color(0XFFbdb29f),
            ),
          )
        ],
        controller: _controller,
      ),
    );
  }
}
