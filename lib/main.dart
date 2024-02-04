import 'package:flutter/material.dart';
import 'package:movieapp/injection_container.dart';
import 'package:movieapp/presentation/widgets/movie_list.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: const MovieList(),
      ),
    );
  }
}
