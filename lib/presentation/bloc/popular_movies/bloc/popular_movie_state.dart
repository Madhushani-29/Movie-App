part of 'popular_movie_bloc.dart';

sealed class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoading extends PopularMoviesState {}

class PopularMoviesLoadingSuccess extends PopularMoviesState {
  final List<Movie> movies;
  PopularMoviesLoadingSuccess(this.movies);
}

class PopularMoviesLoadingFailure extends PopularMoviesState {
  final String message;

  PopularMoviesLoadingFailure(this.message);
}
