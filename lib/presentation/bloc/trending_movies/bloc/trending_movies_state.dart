part of 'trending_movies_bloc.dart';

sealed class TrendingMoviesState {}

class TrendingMoviesInitial extends TrendingMoviesState {}

class TrendingMoviesLoading extends TrendingMoviesState {}

class TrendingMoviesLoadingSuccess extends TrendingMoviesState {
  final List movies;

  TrendingMoviesLoadingSuccess(this.movies);
}

class TrendingMoviesLoadingFailure extends TrendingMoviesState {
  final List movies;

  TrendingMoviesLoadingFailure(this.movies);
}
