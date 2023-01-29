import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movies/firebase_Uitils/firebase_Utils.dart';
import 'package:movies/firebase_Uitils/modelFirebase/modelMovies.dart';
import 'package:movies/generated/assets.dart';
import 'package:movies/myProvider/provider.dart';
import 'package:provider/provider.dart';

import '../../models/TopRatedMovies_response.dart';
import '../../models/popular/Popular_movies.dart';
import '../../models/search/Search_Model.dart';
import '../../shared/constants/constants.dart';
import '../../shared/network/remote/api_manager.dart';
import '../../styles/colors.dart';
import '../home_screen/details_Screen.dart';


class WatchList_Screen extends StatefulWidget {
  const WatchList_Screen({Key? key}) : super(key: key);
  static const String routeName="WatchList_Screen";
  @override
  State<WatchList_Screen> createState() => _Browse_ScreenState();
}

class _Browse_ScreenState extends State<WatchList_Screen> {
  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<MyPervider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Watch List"),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot<MyMoviesList>>(
            stream: getMovieFromFirestore(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.deepOrangeAccent,
                  ),
                );
              }
              var listWatch = snapshot.data?.docs.map((doc) => doc.data()).toList()??[] ;
              if( listWatch.isEmpty){
                Center(
                  child: Text("No Movies",
                  style: TextStyle(
                    color: Colors.white
                  ),
                  )
                );
              }
              print("${listWatch.length} <- ListWatch");
              return Expanded(
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          provider.id = listWatch[index].id as int;
                          print(provider.id);
                          Navigator.pushNamed(
                            context,
                            DetailsScreen.routeName,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: Alignment.topLeft,
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        .25,
                                    width: 150,
                                    child: Image.network(
                                      "${showImage}${listWatch[index].image}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
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
                                      crossAxisAlignment:
                                      WrapCrossAlignment.center,
                                      spacing: 5,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            provider.id = listWatch[index].id as int;
                                            print(provider.id);
                                            Navigator.pushNamed(
                                              context,
                                              DetailsScreen.routeName,
                                            );

                                          },
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
                                            "${listWatch[index].title ?? ""}",
                                            style:
                                            TextStyle(color: Colors.grey),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "${listWatch[index].description ?? ""}",
                                        maxLines: 6,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(color: PRIMARY_COLOR),
                                      ),
                                    ),

                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                      ),

                                      child: IconButton(onPressed: (){
                                        deleteTaskFromFirestore(listWatch[index].id);
                                      },
                                          icon: Icon(Icons.delete,
                                          color: Colors.red,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount:listWatch.length ),
              );
            },
          )
        ],
      ),
    );
  }
}
