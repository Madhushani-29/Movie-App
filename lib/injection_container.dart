import 'package:get_it/get_it.dart';
import 'package:movieapp/presentation/bloc/popular_movies/bloc/popular_movie_bloc.dart';
import 'package:movieapp/presentation/bloc/search_movies/bloc/search_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/trending_movies/bloc/trending_movies_bloc.dart';

//Create an instance of the GetIt service locator
final getIt = GetIt.instance;

//init () responsible for initializing and registering dependencies
void init() {
  //Bloc
  getIt.registerFactory(() => PopularMovieBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));
  //Register the PopularMovieBloc as a factory in GetI
  //whenever someone requests an instance of PopularMovieBloc, GetIt will create a new instance

  //Use cases
  //Repositories
  //Data sources
  //Http services
}
