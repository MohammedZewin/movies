class MyMoviesList {
  String id;
  int idFilm;
  String image;
  String title;
  String description;

  MyMoviesList(
      {this.id = "",
      required this.idFilm,
      required this.title,
      required this.description,
      required this.image});

  MyMoviesList.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          idFilm: json['idFilm'],
          title: json['title'],
          description: json['description'],
          image: json["image"],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "idFilm": idFilm,
      'title':title,
      'description':description,
    "image":image,
    };
  }
}
