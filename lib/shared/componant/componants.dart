

import 'package:flutter/material.dart';
import 'package:movies/generated/assets.dart';
import '../../styles/colors.dart';

NewReleases(BuildContext context){
  return Container(
    color: bottomColor,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                clipBehavior:Clip.antiAliasWithSaveLayer ,
                height: 150.74,
                width: 98.78,
                child: Image.network(
                  "https://www.lowyat.net/wp-content/uploads/2019/08/c655484a-dora-3.jpg",
                  fit: BoxFit.fill,

                ),
              ),
              IconButton(
                  onPressed: (){},
                  icon: Image.asset(Assets.imageBookmarkNoSelected,
                  ),

              ),
            ],
          ),
        ),
      ],
    ),
  );
}