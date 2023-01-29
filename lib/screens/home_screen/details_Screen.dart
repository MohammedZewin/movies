import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/generated/assets.dart';
import 'package:movies/models/details_data/Details_Data.dart';
import 'package:movies/myProvider/provider.dart';
import 'package:movies/shared/componant/componants.dart';
import 'package:movies/shared/network/remote/api_manager.dart';
import 'package:provider/provider.dart';
import '../../firebase_Uitils/firebase_Utils.dart';
import '../../firebase_Uitils/modelFirebase/modelMovies.dart';
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
  bool isSelected=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected=true;
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
        if (snapshot.hasError) {
          return Text("ERROR");
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
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * .25,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data?.title ?? "",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        data?.releaseDate ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(height: 1.4, color: Colors.grey),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .05,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.topLeft,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .25,
                                width: 150,
                                child: Image.network(
                                  "${showImage}${data?.posterPath}",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon:
                                      Image.asset(Assets.imageBookmarkNoSelected)),
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
                                  maxLines: 6,
                                  overflow: TextOverflow.ellipsis,
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
                    ],
                  ),
                ),
                Expanded(
                  child: FutureBuilder<SimilarMovies>(
                    future: ApiManager.getSimilarMovies(provider.id),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      var SimilarMovies = snapshot.data?.results ?? [];
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: SimilarMovies.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              provider.id = SimilarMovies[index].id as int;
                              print(provider.id);
                              Navigator.pushReplacementNamed(
                                context,
                                DetailsScreen.routeName,
                              );
                            },
                            child: NewReleases(
                              context,
                              imageSelected: isSelected?Assets.imageIconAddDone:Assets.imageBookmarkNoSelected,
                              imageFromApi:
                                  '$showImage${SimilarMovies[index].backdropPath ?? ''}',
                                addToWatchList: (){

                                  provider.id = SimilarMovies[index].id as int;
                                  MyMoviesList m=MyMoviesList(idFilm: provider.id,
                                      description:SimilarMovies[index].overview??"",
                                  title: SimilarMovies[index].title??"",
                                    image: SimilarMovies[index].posterPath??"",

                                  );
                                 if(m.id!=0){
                                   provider.idMovieList.add(provider.id);
                                   AddMovieToFirestore(m);
                                 }


                                }
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

