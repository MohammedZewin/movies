import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  static const String routeName = "Details_Screen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dora and the lost city of gold"),
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
                      "https://www.lowyat.net/wp-content/uploads/2019/08/c655484a-dora-3.jpg",
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
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   Text("Dora and the lost city of gold",style: TextStyle(color: Colors.white,fontSize: 18),),
                    SizedBox(
                      height: 8,
                    ),
                    Text('2023 PG 13 2h 7m', style: Theme
                        .of(context)
                        .textTheme
                        .caption
                        ?.copyWith(height: 1.4,color: Colors.grey),),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Stack(
                          alignment: Alignment.topLeft,
                          children:
                          [
                            Container(
                              height: 200,
                              width: 150,
                              child: Image.network(
                                "https://www.lowyat.net/wp-content/uploads/2019/08/c655484a-dora-3.jpg",
                                fit: BoxFit.fill,
                              ),
                            ),
                            IconButton(
                                onPressed: (){},
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
                                    onPressed: (){},
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.black),
                                      side: MaterialStatePropertyAll(
                                        BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: Text("Action",style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: (){},
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.black),
                                      side: MaterialStatePropertyAll(
                                        BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: Text("Action",style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: (){},
                                    style: ButtonStyle(
                                      backgroundColor: MaterialStateProperty.all(Colors.black),
                                      side: MaterialStatePropertyAll(
                                        BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    child: Text("Action",style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                  "Having spent most of her life exploring the jungle, nothing could prepare Dora for her most dangerous adventure yet — high school.",
                                  style: TextStyle(color: PRIMARY_COLOR),
                              ),
                              Row(
                                children:
                                [
                                  Icon(
                                    Icons.star,
                                    color: COLOR_GOLD,
                                  ),
                                  Text(
                                    "7.7",
                                    style: TextStyle(color: PRIMARY_COLOR,fontSize: 17),
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
                            padding: const EdgeInsets.only(left: 8.0,bottom: 8.0),
                            child: Text("More Like This",style: TextStyle(
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
      ),
    );
  }

  card(){
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
                  "https://www.lowyat.net/wp-content/uploads/2019/08/c655484a-dora-3.jpg",
                  fit: BoxFit.fill,
                ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: Image.asset("assets/image/bookmark.png")),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Row(
              children:
              [
                Icon(
                  Icons.star,
                  color: COLOR_GOLD,
                ),
                Text(
                  "7.7",
                  style: TextStyle(color: PRIMARY_COLOR,fontSize: 17),
                ),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Sssss",style: TextStyle(color: Colors.white),),
              ],
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('2023 PG 13 2h 7m', style: Theme
                  .of(context)
                  .textTheme
                  .caption
                  ?.copyWith(height: 1.4,color: Colors.white),
              ),
          ),
        ],
      ),
    );
  }
}
