import 'package:movieapp/domain/entities/Movie.dart';
import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/server_failure.dart';

abstract class MovieRepository{
  Future <Either<Failure, List<Movie>>> getTrendingMovies();
  Future <Either<Failure, List<Movie>>> searchMovies(String query);
  Future <Either<Failure, List<Movie>>> getPopularMovies();
}

