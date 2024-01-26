// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movieapp/data/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future <List<MovieModel>> getTrendingMovies ();
  Future <List<MovieModel>> getPopularMovies ();
  Future <List<MovieModel>> searchMovies (String query);
}
