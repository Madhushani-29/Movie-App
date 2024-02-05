import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/injection_container.dart';
import 'package:movieapp/presentation/bloc/popular_movies/bloc/popular_movie_bloc.dart';
import 'package:movieapp/presentation/bloc/search_movies/bloc/search_movies_bloc.dart';
import 'package:movieapp/presentation/bloc/trending_movies/bloc/trending_movies_bloc.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:movieapp/presentation/pages/popular_movies_screen.dart';
import 'package:movieapp/presentation/pages/search_movies_screen.dart';
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
            appBar: AppBar(
              title: Text("TrendWatch"),
            ),
            body: SafeArea(
              child: DefaultTabController(
                length: 3,
                child: Column(
                  children: <Widget>[
                    ButtonsTabBar(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      buttonMargin: EdgeInsets.only(
                        left: 20,
                        top: 10,
                      ),
                      backgroundColor: Colors.orange[400],
                      unselectedBackgroundColor: Colors.orange[100],
                      unselectedLabelStyle: TextStyle(
                          color: Colors.black), // Change the color here
                      labelStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(
                            icon: Text(
                          "Popular Movies",
                          style: TextStyle(color: Colors.black),
                        )),
                        Tab(
                            icon: Text(
                          "Trending Movies",
                          style: TextStyle(color: Colors.black),
                        )),
                        Tab(
                            icon: Text(
                          "Search Movies",
                          style: TextStyle(color: Colors.black),
                        )),
                      ],
                    ),
                    const Expanded(
                      child: TabBarView(
                        children: <Widget>[
                          Center(
                            child: PopularMovieScreen(),
                          ),
                          Center(
                            child: TrendingMovieScreen(),
                          ),
                          Center(
                            child: SearchMovieScreen(),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
