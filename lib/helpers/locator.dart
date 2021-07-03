import 'package:get_it/get_it.dart';
import 'package:hisnulmuslim/helpers/db.dart';

final locator = GetIt.instance;

Future setupLocator() async {
  locator.registerSingleton(Db().azkarDao);
}
