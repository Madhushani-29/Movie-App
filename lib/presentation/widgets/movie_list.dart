import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/Movie.dart';

class MovieList extends StatelessWidget {
  //final List<Movie> movies;
  const MovieList({
    super.key,
    /*required this.movies*/
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: /*movies.length*/ 10,
      itemBuilder: (BuildContext context, int index) {
        //var movie = movies[index];
        return ListTile(
          leading: Image.network(
            'https://picsum.photos/250?image=9',
            width: 50,
            fit: BoxFit.cover,
          ),
          title: Text('Movie Title'),
          subtitle: Text("Movie Overview"),
          onTap: () {},
        );
      },
    );
  }
}
