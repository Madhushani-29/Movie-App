part of 'trending_movies_bloc.dart';

sealed class TrendingMoviesState {}

class TrendingMoviesInitial extends TrendingMoviesState {}

class TrendingMoviesLoading extends TrendingMoviesState {}

class TrendingMoviesLoadingSuccess extends TrendingMoviesState {
  final List<Movie> movies;

  TrendingMoviesLoadingSuccess(this.movies);
}

class TrendingMoviesLoadingFailure extends TrendingMoviesState {
  final String message;

  TrendingMoviesLoadingFailure(this.message);
}
