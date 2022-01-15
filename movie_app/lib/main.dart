import 'package:flutter/material.dart';
import 'package:nicolau/screens/movie_screen/movies_screen.dart';

import 'siderbar/sidebar_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'No Cinema',
      debugShowCheckedModeBanner: false,
      home: SidebarLayout(),
    );
  }
}
