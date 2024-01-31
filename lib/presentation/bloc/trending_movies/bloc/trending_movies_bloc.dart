import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  TrendingMoviesBloc() : super(TrendingMoviesInitial()) {
    on<TrendingMoviesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
