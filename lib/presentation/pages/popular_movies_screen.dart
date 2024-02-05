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
        if (state is PopularMoviesLoadingFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is PopularMoviesLoadingSuccess) {
          return MovieList(movies: state.movies);
        }
        if (state is PopularMoviesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container();
      },
    ));
  }
}
