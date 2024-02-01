part of 'search_movies_bloc.dart';

sealed class SearchMoviesEvent {}

class SearchMovies extends SearchMoviesEvent {
  final String query;

  SearchMovies(this.query);
}
