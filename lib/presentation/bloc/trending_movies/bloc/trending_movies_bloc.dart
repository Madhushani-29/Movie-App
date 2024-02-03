import 'package:bloc/bloc.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;
  TrendingMoviesBloc(this.getTrendingMovies) : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMoviesLoading());
      final failureOrMovies = await getTrendingMovies;
      //fold is a method commonly used with Either or Result types to handle both the success and failure cases
      //takes two functions as parameters
      //The first function is called when the result represents a success
      //The second function is called when the result represents a failure
      failureOrMovies.fold();
    });
  }
}
