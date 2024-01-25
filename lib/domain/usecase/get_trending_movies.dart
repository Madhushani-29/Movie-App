// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:movieapp/domain/entities/Movie.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';

class GetTrendingMovies {
  final MovieRepository repository;
  GetTrendingMovies({
    required this.repository,
  });

  Future <List<Movie>> call() async {
    return await repository.getTrendingMovies();
  }
}
