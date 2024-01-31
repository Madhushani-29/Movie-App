part of 'trending_movies_bloc.dart';

sealed class TrendingMoviesState extends Equatable {
  const TrendingMoviesState();
  
  @override
  List<Object> get props => [];
}

final class TrendingMoviesInitial extends TrendingMoviesState {}
