part of 'search_movies_bloc.dart';

sealed class SearchMoviesEvent {}

class FetchSearchMovies extends SearchMoviesEvent {
  final String query;

  FetchSearchMovies(this.query);
}
