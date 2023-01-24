import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../models/TopRatedMovies_response.dart';
import '../../../models/latestMovies_response.dart';
import '../../../models/popular/Popular_movies.dart';
import '../../../models/popularRespons.dart';

import '../../constants/constants.dart';

class ApiManager {
  //____________________________LatestMovies____________________________________

  static Future<PopularMovies_m> getPopular() async {
    //https://api.themoviedb.org/3/movie/popular?api_key=03dc69d016d798b7fb980e9925529385

    try {
      var url = Uri.https(BASE, PopularMovies, {
        "api_key": APIKEY,
      });
      Response sources = await http.get(url);
      print(sources.statusCode);
      var json = jsonDecode(sources.body);
      PopularMovies_m popularResponse = PopularMovies_m.fromJson(json);
      print('popularResponse');
      return popularResponse;
    } catch (e) {
      throw e;
    }
  }

//____________________________LatestMovies______________________________________
//   https://api.themoviedb.org/3/movie/latest?api_key=03dc69d016d798b7fb980e9925529385
  static Future<LatestMovies_response> getLatestMovies() async {
    var url = Uri.https(BASE, movieLatest, {
      "api_key": APIKEY,
    });
    try {
      Response LatestMovies = await http.get(url);
      print(LatestMovies.statusCode);
      var json = jsonDecode(LatestMovies.body);
      LatestMovies_response latestMovies_response =
          LatestMovies_response.fromJson(json);
      return latestMovies_response;
    } catch (e) {
      rethrow;
    }
  }

//____________________________LatestMovies______________________________________
//   //https://api.themoviedb.org/3/movie/top_rated?api_key=03dc69d016d798b7fb980e9925529385
  static Future<TopRatedMovies_response> getTopRatedMovies() async {
    var url = Uri.https(BASE, '/3/movie/top_rated', {"api_key": APIKEY});
    try {
      Response TopRatedMovies = await http.get(url);
      print(TopRatedMovies.statusCode);
      var json = jsonDecode(TopRatedMovies.body);
      TopRatedMovies_response topRatedMovies_response =
          TopRatedMovies_response.fromJson(json);
      return topRatedMovies_response;
    } catch (e) {
      throw e;
    }
  }
}
