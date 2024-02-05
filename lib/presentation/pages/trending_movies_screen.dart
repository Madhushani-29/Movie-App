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
        if (state is TrendingMoviesLoadingFailure) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        if (state is TrendingMoviesLoadingSuccess) {
          return MovieList(movies: state.movies);
        }
        if (state is TrendingMoviesLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.orange,
            ),
          );
        }
        return Container();
      },
    ));
  }
}
