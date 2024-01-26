import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:movieapp/core/error/server_exception.dart';
import 'package:movieapp/data/data_source/movie_remote_data_source.dart';
import 'package:movieapp/data/data_source/remote/movie_remote_data_source_impl.dart';

import 'movie_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MovieRemoteDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  final String tUrl =
      "https://api.themoviedb.org/3/trending/movie/day?language=en-US&api_key=26e2a7846caf53650a6f9bc938e4dc0d";
  const String sampleAPIResponse = "'''...'''";

  test('should perform a GET request on a url to get trending movies',
      () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(tUrl)))
        .thenAnswer((_) async => http.Response(sampleAPIResponse, 200));
    // act
    await dataSource.getTrendingMovies;
    // assert
    verify(mockHttpClient.get(Uri.parse('our api')));
  });

  test('should throw a ServerException when the response code is 404',
      () async {
    // arrange
    when(mockHttpClient.get(Uri.parse(tUrl)))
        .thenAnswer((_) async => http.Response(sampleAPIResponse, 400));
    // act
    await dataSource.getTrendingMovies;
    final call = dataSource.getTrendingMovies;
    // assert
    expect(() => call(), throwsA(isA<ServerException>));
  });
}
