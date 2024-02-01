part of 'popular_movie_bloc.dart';

sealed class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoadingSuccess extends PopularMoviesState {
  final List movies;
  PopularMoviesLoadingSuccess(this.movies);
}

class PopularMoviesLoadingFailure extends PopularMoviesState {
  final List movies;

  PopularMoviesLoadingFailure(this.movies);
}