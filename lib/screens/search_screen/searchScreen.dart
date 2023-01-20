import 'package:flutter/material.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({Key? key}) : super(key: key);
  static const String routeName="Search_Screen";
  @override
  State<Search_Screen> createState() => _Browse_ScreenState();
}

class _Browse_ScreenState extends State<Search_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
    );
  }
}
