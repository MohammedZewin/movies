import 'package:flutter/material.dart';
import '../models/TopRatedMovies_response.dart';
import '../models/popular/Popular_movies.dart';
import '../models/search/Search_Model.dart';

class MyPervider extends ChangeNotifier{
 var id=0;
 List<Results> watchList = [];
 List <int>idMovieList=[];
 getWatchList(int idid) {
 idMovieList.add(idid);
  notifyListeners();
 }

 var searchController=TextEditingController();
 List<SearchModel> resultsSearch = [];
 searchMovies(String query) async {
  searchController.text=query;
  notifyListeners();}





}