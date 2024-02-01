import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'popular_movie_event.dart';
part 'popular_movie_state.dart';

class PopularMovieBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMovieBloc() : super(PopularMoviesInitial()) {
    on<PopularMoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
