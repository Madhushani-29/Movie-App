	import 'package:dartz/dartz.dart';
	import 'package:flutter_test/flutter_test.dart';
	import 'package:mockito/annotations.dart';
  import 'package:movieapp/domain/entities/Movie.dart';
	import 'package:mockito/mockito.dart';
	import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecase/get_trending_movies.dart';
//	import 'get_popular_movies_test.mocks.dart';
	
	@GenerateNiceMocks([MockSpec<MovieRepository>()])
	
	void main(){
	  late GetTrendingMovies usecase;
	  late MockMovieRepository mockMovieRepository;
	
	  setUp(() {
	    mockMovieRepository = MockMovieRepository();
	    usecase = GetTrendingMovies(mockMovieRepository);
	  });
	
	  final tMoviesList = [
	    Movie(id: 1, title: "Test Movie 1", overview: "Desc 1", posterPath: "/image1"),
	    Movie(id: 2, title: "Test Movie 2", overview: "Desc 2", posterPath: "/image2"),
	  ];
	
	  test('should get popular movies from the repository', () async {
	    // arrange
	    when(mockMovieRepository.getTrendingMovies())
	        .thenAnswer((_) async => Right(tMoviesList));
	    // act
	    final result = await usecase();
	    // assert
	    expect(result, equals(Right(tMoviesList)));
	    verify(mockMovieRepository.getTrendingMovies());
	    verifyNoMoreInteractions(mockMovieRepository);
	  });
}