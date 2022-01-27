import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'providers/movie_provider.dart';
import 'siderbar/sidebar_layout.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        color: Colors.grey,
        debugShowCheckedModeBanner: false,
        home: SidebarLayout(),
      ),
    );
  }
}



