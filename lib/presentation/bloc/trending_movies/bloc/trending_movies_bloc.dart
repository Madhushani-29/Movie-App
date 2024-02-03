import 'package:bloc/bloc.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;
  TrendingMoviesBloc(this.getTrendingMovies) : super(TrendingMoviesInitial()) {}
}
