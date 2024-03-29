import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/core/error/server_exception.dart';
import 'package:movieapp/core/error/server_failure.dart';
import 'package:movieapp/data/data_source/movie_remote_data_source.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/data/repository/movie_repository_impl.dart';
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
    //is a used since it have exceptions also
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(mockMovieRemoteDataSource.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRemoteDataSource);
  });

  test('should get popular movies from the data source', () async {
    // arrange
    when(mockMovieRemoteDataSource.getPopularMovies())
        .thenAnswer((_) async => tMoviesModelList);
    // act
    final result = await repository.getPopularMovies();
    // assert
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(mockMovieRemoteDataSource.getPopularMovies());
    verifyNoMoreInteractions(mockMovieRemoteDataSource);
  });

  test('should get a movie from the data source', () async {
    // arrange
    when(mockMovieRemoteDataSource.searchMovies(tQuery))
        .thenAnswer((_) async => tMoviesModelList);
    // act
    final result = await repository.searchMovies(tQuery);
    // assert
    expect(result, isA<Right<Failure, List<Movie>>>());
    verify(mockMovieRemoteDataSource.searchMovies(tQuery));
    verifyNoMoreInteractions(mockMovieRemoteDataSource);
  });

  test(
      'should return ServerFailure when the call to remote data source is unsuccessful',
      () async {
    // arrange
    when(mockMovieRemoteDataSource.getPopularMovies())
        .thenThrow(ServerException());
    // act
    final result = await repository.getPopularMovies();
    // assert
    expect(result, isA<Left<ServerFailure, List<Movie>>>());
    expect(result.fold(id, id), isA<ServerFailure>());
  });

  test(
      'should return a server failure when the call to the remote data source is unsuccessful',
      () async {
    // arrange
    when(mockMovieRemoteDataSource.getTrendingMovies())
        .thenThrow(ServerException());
    // act
    final result = await repository.getTrendingMovies();
    // assert
    expect(result, isA<Left<ServerFailure, List<Movie>>>());
    expect(result.fold(id, id), isA<ServerFailure>());
  });

  test(
      'should return a server failure when the call to the remote data source is unsuccessful',
      () async {
    // arrange
    when(mockMovieRemoteDataSource.searchMovies(tQuery))
        .thenThrow(ServerException());
    // act
    final result = await repository.searchMovies(tQuery);
    // assert
    expect(result, isA<Left<ServerFailure, List<Movie>>>());
    expect(result.fold(id, id), isA<ServerFailure>());
  });
}
