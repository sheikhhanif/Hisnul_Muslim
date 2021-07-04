import 'package:flutter/material.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/views/prayer_times_view/prayer_times_view.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      padding: EdgeInsets.only(left: 16, right: 16, top: 70),
      width: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hisnullmuslim',
            style: TextStyle(
                color: kAccentColor, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          buildListItem(
              image: 'masjed.png',
              title: 'Prayer Times',
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => PrayerTimesView()));
              })
        ],
      ),
    );
  }

  Widget buildListItem(
      {required String title, required String image, required Function onTap}) {
    return RawMaterialButton(
      onPressed: () => onTap(),
      child: Row(
        children: [
          Image.asset(
            'assets/images/icons/$image',
            width: 25,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          )
        ],
      ),
    );
  }
}
