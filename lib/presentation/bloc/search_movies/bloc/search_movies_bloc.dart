import 'package:bloc/bloc.dart';
import 'package:movieapp/domain/entities/Movie.dart';
import 'package:movieapp/domain/usecase/search_movies.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  SearchMoviesBloc({required this.searchMovies})
      : super(SearchMoviesInitial()) {
    on<FetchSearchMovies>((event, emit) async {
      emit(SearchMoviesLoading());
      final failureOrMovies = await searchMovies(event.query);
      failureOrMovies.fold(
        (failure) => emit(SearchMoviesLoadingFailure(failure.toString())),
        (movie) => emit(SearchMoviesLoadingSuccess(movie)),
      );
    });
  }
}
