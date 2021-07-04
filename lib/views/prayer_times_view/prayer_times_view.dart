import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/providers/prayer_times_provider.dart';
import 'package:hisnulmuslim/widgets/loading_view.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PrayerTimesView extends StatelessWidget {
  const PrayerTimesView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PrayerTimesProvider(),
      builder: (context, __) => Scaffold(
        appBar: AppBar(
          title: Text('Prayer Times'),
          centerTitle: false,
        ),
        body: Provider.of<PrayerTimesProvider>(context).loading
            ? LoadingView()
            : Provider.of<PrayerTimesProvider>(context).location == null
                ? buildGetLocationWidget(context)
                : Container(
                    padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Time Zone',
                          style: TextStyle(color: kBrownTextColor),
                        ),
                        Text(Provider.of<PrayerTimesProvider>(context)
                                .placeTitle ??
                            ''),
                        Text(
                          DateFormat('d MMMM y').format(DateTime.now()),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        buildPrayerTimeListwidget(context),
                        Text(
                          'Timing Calculation Method:',
                          style: TextStyle(color: kBrownTextColor),
                        ),
                        Text(
                          'Umm Al-Qura University, Makkah',
                          style: TextStyle(color: kBrownTextColor),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }

  Widget buildPrayerTimeListwidget(context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 24),
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: kPrimaryColorLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: Provider.of<PrayerTimesProvider>(context)
              .prayers!
              .entries
              .map((e) => buildPrayerTimeWidget(e.key, e.value.toString()))
              .toList(),
        ),
      ),
    );
  }

  Row buildPrayerTimeWidget(String title, String time) {
    final formatter = DateFormat().add_jm();

    return Row(
      children: [
        Icon(Icons.ac_unit),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text(
            title,
          ),
        ),
        Text(
          formatter.format(DateTime(
              2000,
              1,
              1,
              int.parse(time.split(':').first),
              int.parse(time.split(':').last))),
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  buildGetLocationWidget(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: kPrimaryColorLight,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Accept Location Permission to get the prayertimes',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: EdgeInsets.only(top: 8),
              width: 200,
              child: RawMaterialButton(
                shape: StadiumBorder(),
                fillColor: kAccentColor,
                onPressed: () =>
                    Provider.of<PrayerTimesProvider>(context, listen: false)
                        .determinePosition(),
                child: Text(
                  'Get Prayer Times',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
