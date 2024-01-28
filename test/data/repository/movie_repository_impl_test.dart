import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/data/data_source/movie_remote_data_source.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/domain/entities/Movie.dart';

import 'movie_repository_impl_test.mocks.dart';

@GenerateNiceMocks([MockSpec<MovieRemoteDataSource>()])
void main() {
  late MovieRepositoryImpl repository;
  late MockMovieRemoteDataSource mockMovieRemoteDataSource;

  setUp(() {
    mockMovieRemoteDataSource = MockMovieRemoteDataSource();
    repository =
        MovieRepositoryImpl(remoteDataSource: mockMovieRemoteDataSource);
  });

  final String tQuery = "Avengers";

  final tMoviesModelList = [
    MovieModel(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1"),
    MovieModel(
        id: 2,
        title: "Test Movie 2",
        overview: "Desc 2",
        posterPath: "/image2"),
  ];

  final tMoviesList = [
    Movie(
        id: 1,
        title: "Test Movie 1",
        overview: "Desc 1",
        posterPath: "/image1"),
    Movie(
        id: 2,
        title: "Test Movie 2",
        overview: "Desc 2",
        posterPath: "/image2"),
  ];

  test('should get trending movies from the data source', () async {
    // arrange
    when(mockMovieRemoteDataSource.getTrendingMovies())
        .thenAnswer((_) async => tMoviesModelList);
    // act
    final result = await repository.getTrendingMovies();
    // assert
    expect(result, tMoviesList);
    verify(mockMovieRemoteDataSource.getTrendingMovies());
    //verifyNoMoreInteractions(mockMovieRemoteDataSource);
  });

  test('should get popular movies from the data source', () async {
    // arrange
    when(mockMovieRemoteDataSource.getPopularMovies())
        .thenAnswer((_) async => tMoviesModelList);
    // act
    final result = await repository.getPopularMovies();
    // assert
    expect(result, tMoviesList);
    verify(mockMovieRemoteDataSource.getPopularMovies());
    //verifyNoMoreInteractions(mockMovieRemoteDataSource);
  });

  test('should get a movie from the data source', () async {
    // arrange
    when(mockMovieRemoteDataSource.searchMovies(tQuery))
        .thenAnswer((_) async => tMoviesModelList);
    // act
    final result = await repository.searchMovies(tQuery);
    // assert
    expect(result, tMoviesList);
    verify(mockMovieRemoteDataSource.searchMovies(tQuery));
    //verifyNoMoreInteractions(mockMovieRemoteDataSource);
  });
}
