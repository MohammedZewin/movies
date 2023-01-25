import 'package:flutter/material.dart';
import 'package:movies/provider.dart';
import 'package:movies/screens/browse_screen/browseScreen.dart';
import 'package:movies/screens/home_screen/HomeScreen.dart';
import 'package:movies/screens/home_screen/details_Screen.dart';
import 'package:movies/styles/myTheme.dart';
import 'package:provider/provider.dart';

import 'layout/home_layout/home_layout.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MyPervider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routeName,
      routes: {
        Browse_Screen.routeName: (context) => Browse_Screen(),
        HomeLayout.routeName: (context) => HomeLayout(),
        Home_Screen.routeName: (context) => Home_Screen(),
        DetailsScreen.routeName: (context) => DetailsScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
