import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:movieapp/data/data_source/movie_remote_data_source.dart';

import 'movie_remote_data_source_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MovieRemoteDataSource dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = MovieRemoteDataSource(client:mockHttpClient);
  });

  test('should perform a GET request on a url to get trending movies', () async {
    // arrange
    when(mockHttpClient.get(any))
        .thenAnswer((_) async => http.Response('our response', 200));
    // act
    await dataSource.getTrendingMovies();
    // assert
    verify(mockHttpClient.get(Uri.parse('our api')));
  });
}
