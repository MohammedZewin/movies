import 'package:flutter/material.dart';
import 'package:movies/shared/network/remote/api_manager.dart';
import '../../models/popularRespons.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);
  static const String routeName = "Home_Screen";

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Popular_response>(
      future: ApiManager.getPopular(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.data!.message!,
              style: TextStyle(color: Colors.white),
            ),
          );
        };
        if (snapshot.data!.results == 'ok') {
          return Center(child: Text(snapshot.data!.message!));
        }
        var popularMovies = snapshot.data!.results ?? [];
        return ListView.builder(
          itemCount: popularMovies.length,
          itemBuilder: (context, index) {
            return Text(
              "fffffffffffffffffffffffff",
              style: TextStyle(color: Colors.white),
            );
          },
        );
      },
    );
  }
}
