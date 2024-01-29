import 'package:movieapp/domain/entities/Movie.dart';

import '../../domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  @override
  Future<List<Movie>> getPopularMovies() {
    // TODO: implement getPopularMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getTrendingMovies() {
    // TODO: implement getTrendingMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> searchMovies(String query) {
    // TODO: implement searchMovies
    throw UnimplementedError();
  }
}
