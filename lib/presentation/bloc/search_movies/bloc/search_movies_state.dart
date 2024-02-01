part of 'search_movies_bloc.dart';

sealed class SearchMoviesState {}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesLoadingSuccess extends SearchMoviesState {
  final List movies;
  SearchMoviesLoadingSuccess(this.movies);
}

class SearchMoviesLoadingFailure extends SearchMoviesState {
  final String message;

  SearchMoviesLoadingFailure(this.message);
}