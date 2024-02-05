import 'package:bloc/bloc.dart';
import 'package:movieapp/domain/entities/Movie.dart';
import 'package:movieapp/domain/usecase/get_popular_movies.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;
  PopularMovieBloc({required this.getPopularMovies})
      : super(PopularMoviesInitial()) {
    on<FetchPopularMovies>((event, emit) async {
      emit(PopularMoviesLoading());
      final failureOrMovies = await getPopularMovies();
      failureOrMovies.fold(
          (failure) => emit(PopularMoviesLoadingFailure(failure.toString())),
          (movies) => emit(PopularMoviesLoadingSuccess(movies)));
    });
  }
}
