import 'package:get_it/get_it.dart';
import 'package:movieapp/data/data_source/movie_remote_data_source.dart';
import 'package:movieapp/data/data_source/remote/movie_remote_data_source_impl.dart';
import 'package:movieapp/data/repository/movie_repository_impl.dart';
import 'package:movieapp/domain/repositories/movie_repository.dart';
import 'package:movieapp/domain/usecase/get_popular_movies.dart';
import 'package:movieapp/domain/usecase/get_trending_movies.dart';
import 'package:movieapp/domain/usecase/search_movies.dart';
import 'package:movieapp/presentation/bloc/popular_movies/bloc/popular_movie_bloc.dart';
import 'package:movieapp/presentation/bloc/search_movies/bloc/search_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/trending_movies/bloc/trending_movies_bloc.dart';
import 'package:http/http.dart' as http;

//Create an instance of the GetIt service locator
final getIt = GetIt.instance;

//init () is responsible for initializing and registering dependencies
void init() {
  //Bloc
  getIt.registerFactory(() => PopularMovieBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));
  //Register the PopularMovieBloc as a factory in GetI
  //whenever someone requests an instance of PopularMovieBloc, GetIt will create a new instance

  //Use cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));
  //It ensures that only one instance of GetPopularMovies exists in the application
  //instance is created only when it is first requested

  //Repositories
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: getIt()));

  //Data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: getIt()));

  //Http services
  getIt.registerLazySingleton(() => http.Client());
}
