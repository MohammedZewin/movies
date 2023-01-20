import 'package:flutter/material.dart';
import 'package:movies/screens/home_screen/HomeScreen.dart';
import 'package:movies/styles/myTheme.dart';


import 'layout/home_layout/home_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomeLayout.routName,
      routes: {
        HomeLayout.routName: (context) => const HomeLayout(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}
