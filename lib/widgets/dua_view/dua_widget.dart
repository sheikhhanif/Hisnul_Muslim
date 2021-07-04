import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';

class DuaWidget extends StatelessWidget {
  const DuaWidget({
    Key? key,
    required this.dua,
  }) : super(key: key);

  final Dua dua;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              dua.arDua ?? '',
              style: TextStyle(
                fontFamily: 'quran',
                fontSize: 35,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColorLight,
              borderRadius: BorderRadius.circular(20),
            ),
            child: IconButton(
                icon: Icon(Icons.play_arrow_outlined),
                onPressed: () async {
                  try {
                    await locator<AudioPlayer>()
                        .play('https://www.hisnulmuslim.com/audio/${dua.id}');
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Could not play the Audio , Please try again')));
                  }
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              dua.enTranslation ?? '',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
