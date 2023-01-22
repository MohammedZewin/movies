import 'package:flutter/material.dart';
import 'package:movies/screens/home_screen/homeScreenAuto.dart';
import 'package:movies/shared/network/remote/api_manager.dart';
import '../../models/popularRespons.dart';
import '../../shared/componant/componants.dart';
import 'details_Screen.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);
  static const String routeName = "Home_Screen";

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueAccent,
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, DetailsScreen.routeName);
                },
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Image.network(
                      "https://sm.ign.com/t/ign_mear/review/d/dora-and-t/dora-and-the-lost-city-of-gold-review_4eeh.1200.jpg",
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width,
                       height: MediaQuery.of(context).size.height,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            color: Colors.black,
                            height: 90,
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            color: Colors.black,
                            height: 90,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Dora and the lost city of gold",
                                    textAlign: TextAlign.start,
                                    maxLines: 1,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "2019  PG-13  2h 7m",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:  EdgeInsets.only(
                        left: 8,
                        bottom: 8,
                        top: 40
                      ),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child:  Image(
                          image: NetworkImage("https://upload.wikimedia.org/wikipedia/ar/7/7c/Superman2.jpg"),
                          fit: BoxFit.fill,
                          width: 130,
                          height: MediaQuery.of(context).size.height*0.20,

                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NewReleases(context),
                  NewReleases(context),
                  NewReleases(context),
                  NewReleases(context),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NewReleases(context),
                  NewReleases(context),
                  NewReleases(context),
                  NewReleases(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
