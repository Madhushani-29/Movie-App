import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/Movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;
  const MovieList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (BuildContext context, int index) {
        var movie = movies[index];
        return ListTile(
          leading: Image.network(
            'https://image.tmdb.org/t/p/w500/${movie.posterPath}',
            width: 80,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
          ),
          title: Text(
            movie.title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(movie.overview),
          onTap: () {},
        );
      },
    );
  }
}
