import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:hisnulmuslim/widgets/dua_view/dua_list.dart';

class DuaView extends StatefulWidget {
  const DuaView({
    Key? key,
    required this.title,
    required this.id,
    this.duas,
    this.sectionTitle,
  }) : super(key: key);
  final String title;
  final String? sectionTitle;
  final int id;
  final List<Dua>? duas;

  @override
  _DuaViewState createState() => _DuaViewState();
}

class _DuaViewState extends State<DuaView> {
  bool isBookMarked = false;

  late final PageController _pageController;
  late String title;
  late int currentIndex;
  int? duaGroupLength;
  String? sectionTitle;
  @override
  void initState() {
    super.initState();
    title = widget.title;
    currentIndex = widget.id;
    getIsBookmarked();

    getDuasGroupsLength();
    setSectionTitle();
    _pageController = PageController(initialPage: widget.id);
  }

  @override
  void didUpdateWidget(covariant DuaView oldWidget) {
    super.didUpdateWidget(oldWidget);
    getIsBookmarked();
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
                    if (currentIndex < duaGroupLength! && widget.duas == null) {
                      currentIndex += 1;
                      _pageController.nextPage(
                          duration: kThemeAnimationDuration,
                          curve: Curves.ease);
                    }
                  },
                  onPrev: () {
                    if (currentIndex > 1 && widget.duas == null) {
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
              print(widget.duas);
              return DuaListView(
                list: widget.duas,
                id: currentIndex,
              );
            },
          ),
        ),
      ),
    );
  }

  void onPageChange(index) async {
    if (widget.id > 0) {
      var duaGroup =
          await locator<AzkarDao>().getDuaGroupsTitleByDuaId(currentIndex);
      try {
        var category =
            await locator<AzkarDao>().getCategoryByDuaGroupId(duaGroup.id);
        sectionTitle = category!.enTitle;
        getIsBookmarked();
      } catch (_) {
        sectionTitle = '';
      }

      title = duaGroup.enTitle ?? '';

      setState(() {});
    }
  }

  setSectionTitle() async {
    try {
      var category =
          await locator<AzkarDao>().getCategoryByDuaGroupId(currentIndex);
      sectionTitle = category!.enTitle;
      setState(() {});
    } catch (_) {
      sectionTitle = '';
    }
  }

  SliverAppBar buildAppBar() {
    return SliverAppBar(
      floating: false,
      pinned: false,
      actions: widget.id != -1
          ? [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                    icon: Icon(
                      isBookMarked ? Icons.star : Icons.star_outline,
                      size: 27,
                    ),
                    onPressed: () async {
                      var duaGroup = await locator<AzkarDao>()
                          .getDuaGroupsTitleByDuaId(currentIndex);
                      setState(() {
                        duaGroup =
                            duaGroup.copyWith(isBookmark: !duaGroup.isBookmark);
                        isBookMarked = duaGroup.isBookmark;
                      });
                      locator<AzkarDao>().updateDuaGroupBookmark(duaGroup);
                    }),
              )
            ]
          : null,
      title: Text(
        widget.sectionTitle ?? sectionTitle ?? '',
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

  void getIsBookmarked() async {
    if (widget.id != -1) {
      isBookMarked =
          await locator<AzkarDao>().getIsBookMarkedDuaGroup(currentIndex);
      setState(() {});
    }
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
      child: Align(
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColorLight,
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                ),
              ),
              IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: () => onNext()),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 150;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
