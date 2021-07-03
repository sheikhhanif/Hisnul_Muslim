import 'package:flutter/material.dart';
import 'package:hisnulmuslim/helpers/constants.dart';

class SearchView extends StatefulWidget {
  SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Column(
        children: [
          TextField(
            style: TextStyle(fontSize: 18),
            controller: _controller,
            decoration: InputDecoration(
              prefixIcon: IconButton(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  icon: Icon(
                    Icons.search,
                    color: kAccentColor,
                    size: 30,
                  ),
                  onPressed: () {}),
              suffixIcon: IconButton(
                  padding: EdgeInsets.only(right: 30),
                  icon: Icon(
                    Icons.close,
                    color: kAccentColor,
                    size: 30,
                  ),
                  onPressed: () => _controller.clear()),
              filled: true,
              hintText: "Search",
              fillColor: kPrimaryColorLight,
              hintStyle: TextStyle(fontSize: 18),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
