// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movieapp/domain/entities/Movie.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:movieapp/core/error/server_failure.dart';

class SearchMovies {
  final MovieRepository repository;
  SearchMovies(
    this.repository,
  );

  Future <Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
