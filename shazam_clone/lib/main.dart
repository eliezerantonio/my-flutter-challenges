import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shazam_clone/models/deezer_song_manager.dart';
import 'package:shazam_clone/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DeezerSongManager())],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shazam Clone',
        home: HomePage(),
      ),
    );
  }
}
