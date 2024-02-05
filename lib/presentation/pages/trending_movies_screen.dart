import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/trending_movies/bloc/trending_movies_bloc.dart';
import 'package:movieapp/presentation/widgets/movie_list.dart';

class TrendingMovieScreen extends StatelessWidget {
  const TrendingMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<TrendingMoviesBloc, TrendingMoviesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is TrendingMoviesInitial) {
          return Text("Initial");
        }
        if (state is TrendingMoviesLoadingSuccess) {
          print(state.movies);
          return MovieList(movies: state.movies);
        }
        if (state is TrendingMoviesLoadingFailure) {
          return Text("Failure");
        }
        if (state is TrendingMoviesLoading) {
          return Text("Loading");
        }
        return Text("Not");
      },
    ));
  }
}
