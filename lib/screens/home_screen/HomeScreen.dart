import 'package:flutter/material.dart';
import 'package:movies/models/popularRespons.dart';
import 'package:movies/shared/network/remote/api_manager.dart';
import '../../generated/assets.dart';
import '../../models/top_rated.dart';
import '../../shared/componant/componants.dart';
import '../../styles/colors.dart';
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
            child: FutureBuilder<Popular_response>(
              future:ApiManager.getPopular() ,
              builder:(context, snapshot) {
                var posterData=snapshot.data?.results??[];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: posterData.length,
                  itemBuilder:(context, index) {
                  return  PosterScreen(
                      context: context,
                      imagePosterFromApi: 'https://th.bing.com/th/id/R.46d5277fac9343671ba9d716e833268c?rik=LHpk8JA3bE4KlQ&pid=ImgRaw&r=0',
                      imageSelected: Assets.imageBookmarkNoSelected,
                      filmName: '${posterData[index].title}',
                      date: '${posterData[index].releaseDate}',
                      imageMiniPosterApi: 'https://th.bing.com/th/id/R.46d5277fac9343671ba9d716e833268c?rik=LHpk8JA3bE4KlQ&pid=ImgRaw&r=0',
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
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  NewReleases(context,
                      imageSelected: Assets.imageBookmarkNoSelected,
                      imageFromApi:
                          "https://www.photoshopbuzz.com/wp-content/uploads/how-to-select-an-image-in-photoshop-8.png",
                      onPressed: () {}),
                  NewReleases(context,
                      imageSelected: Assets.imageBookmarkNoSelected,
                      imageFromApi:
                          "https://www.photoshopbuzz.com/wp-content/uploads/how-to-select-an-image-in-photoshop-8.png",
                      onPressed: () {}),
                  NewReleases(context,
                      imageSelected: Assets.imageBookmarkNoSelected,
                      imageFromApi:
                          "https://www.photoshopbuzz.com/wp-content/uploads/how-to-select-an-image-in-photoshop-8.png",
                      onPressed: () {}),
                  NewReleases(context,
                      imageSelected: Assets.imageBookmarkNoSelected,
                      imageFromApi:
                          "https://www.photoshopbuzz.com/wp-content/uploads/how-to-select-an-image-in-photoshop-8.png",
                      onPressed: () {}),
                  NewReleases(context,
                      imageSelected: Assets.imageBookmarkNoSelected,
                      imageFromApi:
                          "https://www.photoshopbuzz.com/wp-content/uploads/how-to-select-an-image-in-photoshop-8.png",
                      onPressed: () {}),
                  NewReleases(context,
                      imageSelected: Assets.imageBookmarkNoSelected,
                      imageFromApi:
                          "https://www.photoshopbuzz.com/wp-content/uploads/how-to-select-an-image-in-photoshop-8.png",
                      onPressed: () {}),
                  NewReleases(context,
                      imageSelected: Assets.imageBookmarkNoSelected,
                      imageFromApi:
                          "https://www.photoshopbuzz.com/wp-content/uploads/how-to-select-an-image-in-photoshop-8.png",
                      onPressed: () {}),
                  NewReleases(context,
                      imageSelected: Assets.imageBookmarkNoSelected,
                      imageFromApi:
                          "https://www.photoshopbuzz.com/wp-content/uploads/how-to-select-an-image-in-photoshop-8.png",
                      onPressed: () {}),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            color: bottomColor,

            width: MediaQuery.of(context).size.width,
            child:  const Padding(
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
            child: FutureBuilder<TopRated>(
              future:ApiManager.getTopRatedMovies() ,
              builder:(context, snapshot) {
                var TopRate=snapshot.data?.results??[];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: TopRate.length,
                  itemBuilder:(context, index) {
                    return  NewReleases(context,
                        imageSelected: Assets.imageBookmarkNoSelected,
                        imageFromApi: 'https://ok.arbcinema.com/wp-content/uploads/2021/11/%D9%81%D9%8A%D9%84%D9%85-last-D-2021-%D9%85%D8%AA%D8%B1%D8%AC%D9%85-%D9%85%D8%B4%D8%A7%D9%87%D8%AF%D8%A9-%D8%A7%D9%88%D9%86-%D9%84%D8%A7%D9%8A%D9%86-268x333.jpg'
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
