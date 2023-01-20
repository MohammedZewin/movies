import 'dart:convert';


import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../models/TopRatedMovies_response.dart';
import '../../../models/latestMovies_response.dart';
import '../../../models/popularRespons.dart';
import '../../constants/constants.dart';

class ApiManager {
  //https://api.themoviedb.org/3/movie/popular?api_key=03dc69d016d798b7fb980e9925529385
  //____________________________LatestMovies____________________________________

  bool isLoding=false;
  static Future<Popular_response> getPopular() async {
    //https://api.themoviedb.org/3/movie/popular?api_key=03dc69d016d798b7fb980e9925529385
    print("1111111111111111111111");
    var url = Uri.https('api.themoviedb.org', '3/movie/popular', {
      "api_key": '03dc69d016d798b7fb980e9925529385',

    });
    try {
      Response sources = await http.get(url);
      print("ddddddddddddddddd");
      print(sources.statusCode);
      print("success");
      var json = jsonDecode(sources!.body);
      Popular_response popularResponse = Popular_response.fromJson(json);
      print(popularResponse.page);
      return popularResponse;
    } catch (e) {
      throw e;
    }
  }
//____________________________LatestMovies______________________________________
  //https://api.themoviedb.org/3/movie/latest?api_key=03dc69d016d798b7fb980e9925529385
  static Future<LatestMovies_response> getLatestMovies() async {
    var url = Uri.https(BASE, '/movie/latest', {"api_key": APIKEY});
    try {
      Response LatestMovies = await http.get(url);
      print(LatestMovies.statusCode);
      var json = jsonDecode(LatestMovies.body);
      LatestMovies_response latestMovies_response = LatestMovies_response.fromJson(json);
      return latestMovies_response;
    } catch (e) {
      throw e;
    }
  }

//____________________________LatestMovies______________________________________
  //https://api.themoviedb.org/3/movie/top_rated?api_key=03dc69d016d798b7fb980e9925529385
  static Future<TopRatedMovies_response> getTopRatedMovies() async {
    var url = Uri.https(BASE, '/movie/top_rated', {"api_key": APIKEY});
    try {
      Response TopRatedMovies = await http.get(url);
      print(TopRatedMovies.statusCode);
      var json = jsonDecode(TopRatedMovies.body);
      TopRatedMovies_response topRatedMovies_response = TopRatedMovies_response.fromJson(json);
      return topRatedMovies_response;
    } catch (e) {
      throw e;
    }
  }


}
