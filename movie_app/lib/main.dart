import 'package:flutter/material.dart';
import 'package:nicolau/screens/movies_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: MoviesScreen(),
    );
  }
}
