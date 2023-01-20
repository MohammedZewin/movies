import 'package:flutter/material.dart';
import 'package:movies/styles/colors.dart';
import '../../generated/assets.dart';
import '../../screens/browse_screen/browseScreen.dart';
import '../../screens/home_screen/HomeScreen.dart';
import '../../screens/search_screen/searchScreen.dart';
import '../../screens/watchlist_screen/watchlistScreen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);
  static const String routName = "HomeLayout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          changeTap(index);
        },
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.imageHome)),
              label: "HOME",
              backgroundColor: BLACK_BACKGROUND_nav),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.imageSearch)),
              label: "SEARCH",
              backgroundColor: BLACK_BACKGROUND_nav),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage(Assets.imageBrowse)),
              label: "BROWSE",
              backgroundColor: BLACK_BACKGROUND_nav),
          BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(Assets.imageWatchlist),
              ),
              label: "WATCHLIST",
              backgroundColor: BLACK_BACKGROUND_nav),
        ],
      ),
      body: taps[currentIndex],
    );
  }

  List<Widget> taps = [
      Home_Screen(),
     Browse_Screen(),
    const Search_Screen(),
    const WatchList_Screen(),
  ];

  void changeTap(int index) {
    currentIndex=index;
    setState(() {
    });
  }
}
