import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nicolau/providers/movie_provider.dart';
import 'package:nicolau/screens/movie_screen/movies_screen.dart';
import 'package:provider/provider.dart';

import 'bloc_navigation/bloc_navigation.dart';
import 'siderbar/sidebar_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => MoviesProvider(),
        )
      ],
      child: MaterialApp(
        title: 'No Cinema',
        debugShowCheckedModeBanner: false,
        home: SidebarLayout(),
      ),
    );
  }
}
