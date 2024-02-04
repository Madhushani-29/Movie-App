import 'package:flutter/material.dart';
import 'package:movieapp/injection_container.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        height: 100,
        width: 200,
        color: Colors.pink,
      ),
    );
  }
}
