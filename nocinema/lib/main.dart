import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nocinema/theme/theme.dart';
import 'package:provider/provider.dart';

import 'providers/movie_provider.dart';
import 'services/local_storage.dart';
import 'siderbar/sidebar_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage?.configurePrefs();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final darkMode = LocalStorage.prefs.getInt("darkTheme");
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (context) => MoviesProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ThemeChanger(darkMode ?? 1),
        )
      ],
      child: Builder(builder: (context) {
        var appTheme = context.watch<ThemeChanger>().currentTheme;

        return MaterialApp(
          title: 'NoCinema'.toUpperCase(),
          color: Colors.grey,
          theme: appTheme,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: SidebarLayout(),
        );
      }),
    );
  }
}
