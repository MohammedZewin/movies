import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../../models/popularRespons.dart';
import '../../../models/top_rated.dart';
import '../../constants/constants.dart';

class ApiManager {

  //____________________________LatestMovies____________________________________

  static Future<Popular_response> getPopular() async {
    //https://api.themoviedb.org/3/movie/popular?api_key=03dc69d016d798b7fb980e9925529385


    try {
      var url = Uri.https(BASE, PopularMovies, {
        "api_key": APIKEY,
      });
      Response sources = await http.get(url);
      print(sources.statusCode);
      var json = jsonDecode(sources.body);
      Popular_response popularResponse = Popular_response.fromJson(json);
      print('popularResponse');
      return popularResponse;
    } catch (e) {
      throw e;
    }
  }
//____________________________LatestMovies______________________________________
//   https://api.themoviedb.org/3/movie/latest?api_key=03dc69d016d798b7fb980e9925529385
//   static Future<LatestMovies> getLatestMovies() async {
//     var url = Uri.https(BASE, '/movie/latest', {"api_key": APIKEY});
//     try {
//       Response LatestMovies = await http.get(url);
//       print(LatestMovies.statusCode);
//       var json = jsonDecode(LatestMovies.body);
//       LatestMovies latestMovies_response = LatestMovies.fromJson(json);
//       return latestMovies_response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//____________________________LatestMovies______________________________________
//   //https://api.themoviedb.org/3/movie/top_rated?api_key=03dc69d016d798b7fb980e9925529385
  static Future<TopRated> getTopRatedMovies() async {
    var url = Uri.https(BASE, '/3/movie/top_rated', {"api_key": APIKEY});
    try {
      Response TopRatedMovies = await http.get(url);
      print(TopRatedMovies.statusCode);
      var json = jsonDecode(TopRatedMovies.body);
      TopRated topRatedMovies_response = TopRated.fromJson(json);
      return topRatedMovies_response;
    } catch (e) {
      throw e;
    }
  }


}
