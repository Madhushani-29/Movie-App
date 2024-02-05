import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/injection_container.dart';
import 'package:movieapp/presentation/bloc/popular_movies/bloc/popular_movie_bloc.dart';
import 'package:movieapp/presentation/bloc/search_movies/bloc/search_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/trending_movies/bloc/trending_movies_bloc.dart';
import 'package:movieapp/presentation/pages/popular_movies_screen.dart';
import 'package:movieapp/presentation/pages/trending_movies_screen.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt<PopularMovieBloc>()..add(FetchPopularMovies()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<TrendingMoviesBloc>()..add(FetchTrendingMovies()),
        ),
        BlocProvider(
          create: (context) => getIt<SearchMoviesBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(),
          body: PopularMovieScreen(),
        ),
      ),
    );
  }
}
