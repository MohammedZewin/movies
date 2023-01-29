import 'package:flutter/material.dart';
import 'package:movies/firebase_Uitils/firebase_Utils.dart';
import 'package:movies/firebase_Uitils/modelFirebase/modelMovies.dart';
import 'package:movies/shared/network/remote/api_manager.dart';
import 'package:provider/provider.dart';
import '../../generated/assets.dart';
import '../../models/TopRatedMovies_response.dart';
import '../../models/latestMovies_response.dart';
import '../../models/popular/Popular_movies.dart';
import '../../myProvider/provider.dart';
import '../../shared/componant/componants.dart';
import '../../shared/constants/constants.dart';
import '../../styles/colors.dart';
import 'details_Screen.dart';

class Home_Screen extends StatefulWidget {
  static const String routeName = "Home_Screen";

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  bool isSelected=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     // isSelected=true;
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyPervider>(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<PopularMovies_m>(
              future: ApiManager.getPopular(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var posterData = snapshot.data?.results ?? [];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: posterData.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        provider.id = posterData[index].id as int;
                        print(provider.id);
                        Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                        );
                      },
                      child: PosterScreen(
                          context: context,
                          onPressed: (){
                            isSelected=!isSelected;
                            setState(() {

                            });
                          },
                          imagePosterFromApi:
                              '$showImage${posterData[index].backdropPath ?? ''}',
                          imageSelected: isSelected?Assets.imageIconAddDone:Assets.imageBookmarkNoSelected,
                          filmName: '${posterData[index].title}',
                          date: '${posterData[index].releaseDate}',
                          imageMiniPosterApi:
                              '$showImage${posterData[index].posterPath ?? ''}'),
                    );
                  },
                );
              },
            ),
          ),
          Container(
            color: bottomColor,
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.only(
                left: 25,
                top: 5,
              ),
              child: Text(
                "New Releases ",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<LatestMovies_response>(
              future: ApiManager.getLatestMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var LASTERMOVIES = snapshot.data?.genres ?? [];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // Navigator.pushNamed(context,DetailsScreen.routeName,arguments:LASTERMOVIES[index].  );
                        //
                      },
                      child: NewReleases(context,
                          imageSelected: Assets.imageBookmarkNoSelected,
                          imageFromApi: 'https://ok.arbcinema.com/wp-content/uploads/2021/11'
                              '/%D9%81%D9%8A%D9%84%D9%85-last-D-2021-%D9%85%D8%AA%D8%B1%D8%AC%D'
                              '9%85-%D9%85%D8%B4%D8%A7%D9%87%D8%AF%D8%A9-%D8%A7%D9%88%D9%86-%D9%84'
                              '%D8%A7%D9%8A%D9%86-268x333.jpg',
                          // addToWatchList: (){
                          //   // provider.id = TopRate[index].id as int;
                          //   // MyMoviesList m=MyMoviesList(idFilm: provider.id,
                          //   //   description:LASTERMOVIES[index].overview??"",
                          //   //   title: TopRate[index].title??"",
                          //   //   image: TopRate[index].posterPath??"",
                          //
                          //   );
                          //   AddMovieToFirestore(m);
                          // }
                      ),

                    );
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: bottomColor,
            width: MediaQuery.of(context).size.width,
            child: const Padding(
              padding: EdgeInsets.only(
                left: 25,
                top: 5,
              ),
              child: Text(
                "Recomended",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<TopRatedMovies_response>(
              future: ApiManager.getTopRatedMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var TopRate = snapshot.data?.results ?? [];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: TopRate.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        provider.id = TopRate[index].id as int;
                        print(provider.id);
                        Navigator.pushNamed(
                          context,
                          DetailsScreen.routeName,
                        );
                      },
                      child: NewReleases(context,
                          imageSelected:isSelected?Assets.imageIconAddDone:Assets.imageBookmarkNoSelected,
                          imageFromApi:
                              '$showImage${TopRate[index].backdropPath ?? ''}',
                        addToWatchList: (){

                          provider.id = TopRate[index].id as int;
                          MyMoviesList m=MyMoviesList(idFilm: provider.id,
                            description:TopRate[index].overview??"",
                            title: TopRate[index].title??"",
                            image: TopRate[index].posterPath??"",
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
    );
  }
}
