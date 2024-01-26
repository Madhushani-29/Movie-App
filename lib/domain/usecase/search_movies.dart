// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movieapp/domain/entities/Movie.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

class SearchMovies {
  final MovieRepository repository;
  SearchMovies(
    this.repository,
  );

  Future<List<Movie>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
