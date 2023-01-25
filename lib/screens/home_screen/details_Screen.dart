import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/generated/assets.dart';
import 'package:movies/models/details_data/Details_Data.dart';
import 'package:movies/provider.dart';
import 'package:movies/shared/componant/componants.dart';
import 'package:movies/shared/network/remote/api_manager.dart';
import 'package:provider/provider.dart';
import '../../models/similarMovies/SimilarMovies.dart';
import '../../shared/constants/constants.dart';
import '../../models/TopRatedMovies_response.dart';
import '../../models/popularRespons.dart';
import '../../styles/colors.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "Details_Screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyPervider>(context);
    print(provider.id);
    return FutureBuilder<DetailsData>(
      future: ApiManager.getDetailsData(provider.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.orange,
          ));
        }
        var data = snapshot.data;
        print(data?.title);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              data?.title ?? "",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.network(
                          "${showImage}${data?.backdropPath}",
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_circle_fill_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data?.title ?? "",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          data?.releaseDate ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(height: 1.4, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Container(
                                  height: 200,
                                  width: 150,
                                  child: Image.network(
                                    "${showImage}${data?.posterPath}",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: Image.asset(
                                        "assets/image/bookmark.png")),
                              ],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(
                                    spacing: 5,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                          side: MaterialStatePropertyAll(
                                            BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "${data?.genres?[0].name ?? ""}",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                          side: MaterialStatePropertyAll(
                                            BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "${data?.genres?[1].name ?? ""}",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.black),
                                          side: MaterialStatePropertyAll(
                                            BorderSide(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ),
                                        child: Text(
                                          "${data?.genres?[2].name ?? ""}",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${data?.overview ?? ""}",
                                    style: TextStyle(color: PRIMARY_COLOR),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: COLOR_GOLD,
                                      ),
                                      Text(
                                        "${data?.voteAverage ?? ""}",
                                        style: TextStyle(
                                            color: PRIMARY_COLOR, fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          color: bottomColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, bottom: 8.0),
                                child: Text(
                                  "More Like This",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              FutureBuilder<SimilarMovies>(
                                  future:
                                      ApiManager.getSimilarMovies(provider.id),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    var similar = snapshot.data?.results ?? [];
                                    return SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: ListView.builder(
                                        itemCount: similar.length,
                                        itemBuilder: (context, index) {
                                          print(similar.length);
                                          return Card(
                                            color: bottomColor,
                                            elevation: 50,
                                            shadowColor: Colors.amber,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Stack(
                                                  children: [
                                                    Container(
                                                      height: 200,
                                                      width: 150,
                                                      child: Image.network(
                                                        "${showImage}${similar[index].backdropPath}",
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {},
                                                        icon: Image.asset("assets/image/bookmark.png")),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: COLOR_GOLD,
                                                      ),
                                                      Text(
                                                        "7.7",
                                                        style: TextStyle(color: PRIMARY_COLOR, fontSize: 17),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        "Sssss",
                                                        style: TextStyle(color: Colors.white),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.only(left: 8.0),
                                                  child: Text(
                                                    '2023 PG 13 2h 7m',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .caption
                                                        ?.copyWith(height: 1.4, color: Colors.white),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  card() {
    return Card(
      color: bottomColor,
      elevation: 50,
      shadowColor: Colors.amber,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                width: 150,
                child: Image.network(
                  "",
                  fit: BoxFit.fill,
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset("assets/image/bookmark.png")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: COLOR_GOLD,
                ),
                Text(
                  "7.7",
                  style: TextStyle(color: PRIMARY_COLOR, fontSize: 17),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Sssss",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              '2023 PG 13 2h 7m',
              style: Theme.of(context)
                  .textTheme
                  .caption
                  ?.copyWith(height: 1.4, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  details() {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 200,
                  width: double.infinity,
                  child: Image.network(
                    "results.backdropPath",
                    // "https://www.lowyat.net/wp-content/uploads/2019/08/c655484a-dora-3.jpg",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.play_circle_fill_outlined,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dora and the lost city of gold",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '2023 PG 13 2h 7m',
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(height: 1.4, color: Colors.grey),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          Container(
                            height: 200,
                            width: 150,
                            child: Image.network(
                              "https://www.lowyat.net/wp-content/uploads/2019/08/c655484a-dora-3.jpg",
                              fit: BoxFit.fill,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Image.asset("assets/image/bookmark.png")),
                        ],
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              spacing: 5,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    side: MaterialStatePropertyAll(
                                      BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Action",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    side: MaterialStatePropertyAll(
                                      BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Action",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    side: MaterialStatePropertyAll(
                                      BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Action",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.",
                              style: TextStyle(color: PRIMARY_COLOR),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: COLOR_GOLD,
                                ),
                                Text(
                                  "7.7",
                                  style: TextStyle(
                                      color: PRIMARY_COLOR, fontSize: 17),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    color: bottomColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 8.0, bottom: 8.0),
                          child: Text(
                            "More Like This",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              card(),
                              card(),
                              card(),
                              card(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
