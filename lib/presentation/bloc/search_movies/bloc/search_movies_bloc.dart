import 'package:bloc/bloc.dart';
import 'package:movieapp/domain/entities/Movie.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  SearchMoviesBloc(this.searchMovies) : super(SearchMoviesInitial()) {
    on<SearchMoviesEvent>((event, emit) async {
      emit(SearchMoviesLoading());
    });
  }
}
