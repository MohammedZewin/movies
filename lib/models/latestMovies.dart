// /// adult : false
// /// backdrop_path : null
// /// belongs_to_collection : null
// /// budget : 0
// /// genres : []
// /// homepage : ""
// /// id : 1077580
// /// imdb_id : null
// /// original_language : "en"
// /// original_title : "Shackleton's Cabin"
// /// overview : "On 5 January 1922, world-famous Antarctic explorer Ernest Shackleton died of a heart attack in his cabin aboard The Quest during his final expedition to the South Pole. Moored in Norway, The Quest was broken apart. However, one of the dockers had the foresight to remove Shackleton’s cabin. He took it home and it served as his family’s garden shed for three generations.  Nearly 100 years after Shackleton’s death, the cabin has been donated to a museum in the explorer’s hometown, where master craftsman and Shackleton enthusiast Sven Habermann painstakingly restores it to its former glory. With only one surviving photograph of the cabin’s interior, Sven goes to extreme lengths to retrace every detail, from the wood to the original wallpaper used. Shackleton’s Cabin follows Sven as he rebuilds the cabin and explores the life and final days of his hero."
// /// popularity : 0.0
// /// poster_path : null
// /// production_companies : []
// /// production_countries : []
// /// release_date : ""
// /// revenue : 0
// /// runtime : 52
// /// spoken_languages : []
// /// status : "Released"
// /// tagline : ""
// /// title : "Shackleton's Cabin"
// /// video : true
// /// vote_average : 0.0
// /// vote_count : 0
//
// class LatestMovies {
//   LatestMovies({
//       this.adult,
//       this.backdropPath,
//       this.belongsToCollection,
//       this.budget,
//       this.genres,
//       this.homepage,
//       this.id,
//       this.imdbId,
//       this.originalLanguage,
//       this.originalTitle,
//       this.overview,
//       this.popularity,
//       this.posterPath,
//       this.productionCompanies,
//       this.productionCountries,
//       this.releaseDate,
//       this.revenue,
//       this.runtime,
//       this.spokenLanguages,
//       this.status,
//       this.tagline,
//       this.title,
//       this.video,
//       this.voteAverage,
//       this.voteCount,});
//
//   LatestMovies.fromJson(dynamic json) {
//     adult = json['adult'];
//     backdropPath = json['backdrop_path'];
//     belongsToCollection = json['belongs_to_collection'];
//     budget = json['budget'];
//     if (json['genres'] != null) {
//       genres = [];
//       json['genres'].forEach((v) {
//         genres?.add(Dynamic.fromJson(v));
//       });
//     }
//     homepage = json['homepage'];
//     id = json['id'];
//     imdbId = json['imdb_id'];
//     originalLanguage = json['original_language'];
//     originalTitle = json['original_title'];
//     overview = json['overview'];
//     popularity = json['popularity'];
//     posterPath = json['poster_path'];
//     if (json['production_companies'] != null) {
//       productionCompanies = [];
//       json['production_companies'].forEach((v) {
//         productionCompanies?.add(Dynamic.fromJson(v));
//       });
//     }
//     if (json['production_countries'] != null) {
//       productionCountries = [];
//       json['production_countries'].forEach((v) {
//         productionCountries?.add(Dynamic.fromJson(v));
//       });
//     }
//     releaseDate = json['release_date'];
//     revenue = json['revenue'];
//     runtime = json['runtime'];
//     if (json['spoken_languages'] != null) {
//       spokenLanguages = [];
//       json['spoken_languages'].forEach((v) {
//         spokenLanguages?.add(Dynamic.fromJson(v));
//       });
//     }
//     status = json['status'];
//     tagline = json['tagline'];
//     title = json['title'];
//     video = json['video'];
//     voteAverage = json['vote_average'];
//     voteCount = json['vote_count'];
//   }
//   bool? adult;
//   dynamic backdropPath;
//   dynamic belongsToCollection;
//   num? budget;
//   List<dynamic>? genres;
//   String? homepage;
//   num? id;
//   dynamic imdbId;
//   String? originalLanguage;
//   String? originalTitle;
//   String? overview;
//   num? popularity;
//   dynamic posterPath;
//   List<dynamic>? productionCompanies;
//   List<dynamic>? productionCountries;
//   String? releaseDate;
//   num? revenue;
//   num? runtime;
//   List<dynamic>? spokenLanguages;
//   String? status;
//   String? tagline;
//   String? title;
//   bool? video;
//   num? voteAverage;
//   num? voteCount;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['adult'] = adult;
//     map['backdrop_path'] = backdropPath;
//     map['belongs_to_collection'] = belongsToCollection;
//     map['budget'] = budget;
//     if (genres != null) {
//       map['genres'] = genres?.map((v) => v.toJson()).toList();
//     }
//     map['homepage'] = homepage;
//     map['id'] = id;
//     map['imdb_id'] = imdbId;
//     map['original_language'] = originalLanguage;
//     map['original_title'] = originalTitle;
//     map['overview'] = overview;
//     map['popularity'] = popularity;
//     map['poster_path'] = posterPath;
//     if (productionCompanies != null) {
//       map['production_companies'] = productionCompanies?.map((v) => v.toJson()).toList();
//     }
//     if (productionCountries != null) {
//       map['production_countries'] = productionCountries?.map((v) => v.toJson()).toList();
//     }
//     map['release_date'] = releaseDate;
//     map['revenue'] = revenue;
//     map['runtime'] = runtime;
//     if (spokenLanguages != null) {
//       map['spoken_languages'] = spokenLanguages?.map((v) => v.toJson()).toList();
//     }
//     map['status'] = status;
//     map['tagline'] = tagline;
//     map['title'] = title;
//     map['video'] = video;
//     map['vote_average'] = voteAverage;
//     map['vote_count'] = voteCount;
//     return map;
//   }
//
// }