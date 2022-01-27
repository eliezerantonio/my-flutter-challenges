import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nocinema/theme/theme.dart';
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
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(2),
        )
      ],
      child: Builder(builder: (context) {
        final appTheme = context.watch<ThemeChanger>().currentTheme;
        return MaterialApp(
          title: 'NoCinema'.toUpperCase(),
          color: Colors.grey,
          theme: appTheme,
          debugShowCheckedModeBanner: false,
          home: SidebarLayout(),
        );
      }),
    );
  }
}
