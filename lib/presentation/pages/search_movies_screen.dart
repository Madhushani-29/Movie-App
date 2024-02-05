import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/search_movies/bloc/search_movies_bloc.dart';
import 'package:movieapp/presentation/widgets/movie_list.dart';

class SearchMovieScreen extends StatelessWidget {
  const SearchMovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchMovieBloc = BlocProvider.of<SearchMoviesBloc>(context);
    TextEditingController searchQueryController = TextEditingController();

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    controller: searchQueryController,
                    style: const TextStyle(fontSize: 12),
                    autofocus: true,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      contentPadding: EdgeInsets.symmetric(vertical: 2.0),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      searchMovieBloc.add(
                          FetchSearchMovies(searchQueryController.text.trim()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange[200],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      fixedSize: const Size(100, 30),
                    ),
                    child: const Text(
                      'Search',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: BlocConsumer<SearchMoviesBloc, SearchMoviesState>(
                listener: (context, state) {
                  if (state is SearchMoviesLoadingFailure) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text(state.message)));
                  }
                },
                builder: (context, state) {
                  if (state is SearchMoviesLoadingSuccess) {
                    return MovieList(movies: state.movies);
                  }
                  if (state is SearchMoviesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
