import 'package:flutter/material.dart';
import 'package:hisnulmuslim/daos/azkar_dao.dart';
import 'package:hisnulmuslim/helpers/constants.dart';
import 'package:hisnulmuslim/helpers/db.dart';
import 'package:hisnulmuslim/helpers/locator.dart';
import 'package:hisnulmuslim/views/dua_view/dua_view.dart';

class DuaGroupsItem extends StatefulWidget {
  const DuaGroupsItem(
      {Key? key,
      required this.title,
      this.icon = Icons.favorite,
      this.id,
      required this.onPressed,
      this.sectionTitle})
      : super(key: key);
  final String title;
  final String? sectionTitle;
  final IconData icon;
  final int? id;

  final Function onPressed;

  @override
  _DuaGroupsItemState createState() => _DuaGroupsItemState();
}

class _DuaGroupsItemState extends State<DuaGroupsItem> {
  List<Dua>? duas;
  @override
  void initState() {
    super.initState();
    getDuas();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.id == null
          ? null
          : () => Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => DuaView(
                    title: widget.title,
                    id: widget.id ?? 0,
                    sectionTitle: widget.sectionTitle,
                  ))),
      child: Container(
        padding: EdgeInsets.only(left: 8, right: 16, top: 8, bottom: 8),
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  widget.icon,
                  color: kBrownTextColor,
                ),
                onPressed: () {}),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.title,
                  style: TextStyle(color: kAccentColor, fontSize: 17),
                ),
              ),
            ),
            if (duas != null)
              Text(
                '(${duas?.length ?? ''})',
                style: TextStyle(
                  color: kBrownTextColor,
                ),
              )
          ],
        ),
      ),
    );
  }

  void getDuas() async {
    if (widget.id != null) {
      duas = await locator<AzkarDao>().getDuaByGroupId(widget.id!);
      setState(() {});
    }
  }
}
