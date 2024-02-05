import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/popular_movies/bloc/popular_movie_bloc.dart';
import 'package:movieapp/presentation/bloc/trending_movies/bloc/trending_movies_bloc.dart';
import 'package:movieapp/presentation/widgets/movie_list.dart';

class PopularMovieScreen extends StatelessWidget {
  const PopularMovieScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<PopularMovieBloc, PopularMoviesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is PopularMoviesInitial) {
          return Text("Initial");
        }
        if (state is PopularMoviesLoadingSuccess) {
          print(state.movies);
          return Text("Success");
          //return MovieList(movies: state.movies);
        }
        if (state is PopularMoviesLoadingFailure) {
          return Text("Failure");
        }
        if (state is PopularMoviesLoading) {
          return Text("Loading");
        }
        return Text("Not");
      },
    ));
  }
}
