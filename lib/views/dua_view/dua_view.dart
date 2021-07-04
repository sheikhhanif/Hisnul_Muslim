import 'package:flutter/material.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:hisnulmuslim/widgets/dua_view/dua_list.dart';

class DuaView extends StatefulWidget {
  const DuaView(
      {Key? key,
      required this.title,
      required this.id,
      required this.sectionTitle})
      : super(key: key);
  final String title;
  final String? sectionTitle;

  final int id;

  @override
  _DuaViewState createState() => _DuaViewState();
}

class _DuaViewState extends State<DuaView> {
  late final PageController _pageController;
  late String title;
  late int currentIndex;
  int? duaGroupLength;
  @override
  void initState() {
    super.initState();
    title = widget.title;
    currentIndex = widget.id;
    getDuasGroupsLength();
    _pageController = PageController(initialPage: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            buildAppBar(),
            SliverPersistentHeader(
              delegate: HeaderWidget(
                  title: title,
                  onNext: () {
                    if (currentIndex < duaGroupLength!) {
                      currentIndex += 1;
                      _pageController.nextPage(
                          duration: kThemeAnimationDuration,
                          curve: Curves.ease);
                    }
                  },
                  onPrev: () {
                    if (currentIndex > 1) {
                      currentIndex -= 1;
                      _pageController.previousPage(
                          duration: kThemeAnimationDuration,
                          curve: Curves.ease);
                    }
                  }),
              pinned: true,
            ),
          ],
          body: PageView.builder(
            controller: _pageController,
            onPageChanged: onPageChange,
            itemCount: duaGroupLength,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              print('item builder : current index ${currentIndex}');

              return DuaListView(
                id: currentIndex,
              );
            },
          ),
        ),
      ),
    );
  }

  void onPageChange(index) async {
    var duaGroup =
        await locator<AzkarDao>().getDuaGroupsTitleByDuaId(currentIndex);
    title = duaGroup.enTitle ?? '';
    setState(() {});
  }

  SliverAppBar buildAppBar() {
    return SliverAppBar(
      floating: false,
      pinned: false,
      actions: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          child: IconButton(
              icon: Icon(
                Icons.star_outline,
                size: 35,
              ),
              onPressed: () {}),
        )
      ],
      title: Text(
        widget.sectionTitle ?? '',
        style: TextStyle(
          color: kAccentColor,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void getDuasGroupsLength() async {
    duaGroupLength = await locator<AzkarDao>().getDuaGroupLength();
  }
}

class HeaderWidget extends SliverPersistentHeaderDelegate {
  final String title;
  final Function onNext;
  final Function onPrev;

  HeaderWidget(
      {required this.title, required this.onNext, required this.onPrev});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kPrimaryColor,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: kPrimaryColorLight, borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(horizontal: 16),
        margin: EdgeInsets.all(16),
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios), onPressed: () => onPrev()),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 2,
              ),
            ),
            IconButton(
                icon: Icon(Icons.arrow_forward_ios), onPressed: () => onNext()),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
