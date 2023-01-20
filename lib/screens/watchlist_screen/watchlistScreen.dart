import 'package:flutter/material.dart';


class WatchList_Screen extends StatefulWidget {
  const WatchList_Screen({Key? key}) : super(key: key);
  static const String routeName="WatchList_Screen";
  @override
  State<WatchList_Screen> createState() => _Browse_ScreenState();
}

class _Browse_ScreenState extends State<WatchList_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
    );
  }
}
