import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:hisnulmuslim/views/dua_groups_view/dua_groups_view.dart';
import 'package:hisnulmuslim/widgets/loading_view.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Category>>(
        future: locator<AzkarDao>().getAllCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingView();
          List<Category>? list = snapshot.data;
          return StaggeredGridView.countBuilder(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            crossAxisCount: 4,
            itemCount: list?.length,
            itemBuilder: (BuildContext context, int index) => GestureDetector(
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
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/categories/${list?[index].image}',
                      ),
                      fit: BoxFit.cover),
                ),
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.all(3),
                child: Container(
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.4),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      list?[index].enTitle?.toUpperCase() ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                      maxLines: 1,
                    ),
                  ),
                ),
              ),
            ),
            staggeredTileBuilder: (int index) => StaggeredTile.count(2, 2),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          );
        });
  }
}
