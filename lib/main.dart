import 'package:flutter/material.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:hisnulmuslim/views/home_view/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  locator<AzkarDao>().getAllCategories();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HissnulMuslim',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kPrimaryColor,
        primaryColorDark: kPrimaryColorDark,
        accentColor: kAccentColor,
        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
