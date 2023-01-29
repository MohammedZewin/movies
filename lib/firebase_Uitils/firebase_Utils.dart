
import 'package:cloud_firestore/cloud_firestore.dart';
import 'modelFirebase/modelMovies.dart';


   CollectionReference<MyMoviesList> getMoviesCollection() {
    return FirebaseFirestore.instance
        .collection('MoviesList')
        .withConverter<MyMoviesList>(
          fromFirestore: (snapshot, options) =>
              MyMoviesList.fromJson(snapshot.data()!),
          toFirestore: (movie, options) => movie.toJson(),
        );
  }

   Future<void> AddMovieToFirestore(MyMoviesList moviesList) {
    var collection = getMoviesCollection();
    var docRef = collection.doc();
    moviesList.id=docRef.id;
    print("${moviesList.idFilm}");
    return docRef.set(moviesList);
  }

   Stream<QuerySnapshot<MyMoviesList>> getMovieFromFirestore() {
    return getMoviesCollection().snapshots();
  }

   Future<void> deleteTaskFromFirestore(String id) {
    return getMoviesCollection().doc(id).delete();
  }

