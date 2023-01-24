import 'package:flutter/material.dart';

import '../../styles/colors.dart';

Widget NewReleases(BuildContext context,
    {required String imageSelected,
    required String imageFromApi,
    Function? addToWatchList,
    Function? goMovieDetails,}) {
  return Container(
    color: bottomColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                height: MediaQuery.of(context).size.height * 0.23,
                width: MediaQuery.of(context).size.width * 0.33,
                child: Image.network(
                  imageFromApi,
                  fit: BoxFit.fill,
                ),
              ),
              GestureDetector(
                onTap: () {
                  addToWatchList!();
                },
                child: Image.asset(
                  imageSelected,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
//------------------------------------------------------------------------------

Widget PosterScreen(
    {required BuildContext context,
    Function? inkWellNavigator,
    required String imagePosterFromApi,
    required String imageSelected,
    required String filmName,
    required String date,
    required String imageMiniPosterApi,
    Function? onPressed}) {
  return Padding(
    padding: const EdgeInsets.only(

    ),
    child: Container(
      color: Colors.blueAccent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.network(
            imagePosterFromApi,
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Container(
            alignment: Alignment.bottomRight,
            width: MediaQuery.of(context).size.width,
            color: Colors.black,
            height:50,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 5
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    filmName,
                    textAlign: TextAlign.end,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),

                  Text(
                    date,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,
              bottom: 10
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: MediaQuery.of(context).size.width * 0.45,
                    width: MediaQuery.of(context).size.width * 0.33,
                    child: Image.network(
                      imageMiniPosterApi,
                      fit: BoxFit.fill,
                      height: MediaQuery.of(context).size.width * 0.45,
                      width: MediaQuery.of(context).size.width * 0.33,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      onPressed!();
                    },
                    child: Image.asset(
                      imageSelected,

                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
//------------------------------------------------------------------------------
