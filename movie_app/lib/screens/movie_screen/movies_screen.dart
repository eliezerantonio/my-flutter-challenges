import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nicolau/data/movies.dart';
import 'package:nicolau/utils/myBackgroundColors.dart';
import 'package:nicolau/widgets/custom_widgets.dart';

import 'widgets/item_movie.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  int _current = 0;

  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              Image.network(movies[_current]["image"], fit: BoxFit.cover),
              //backround color
              BackgroundGradiante(
                darkMode: darkMode,
                backgroundDarkMode: backgroundDarkMode,
                backgroundWhiteMode: backgroundWhiteMode,
              ),

              //carousel movies
              carouselSlider(context),

              //switch dark and white mode
              buttonDarkMode()
            ],
          ),
        ),
      ),
    );
  }

  Positioned buttonDarkMode() {
    return Positioned(
      top: 0,
      right: 10,
      child: Switch(
        activeColor: Colors.white,
        inactiveThumbColor: Colors.black,
        value: darkMode,
        onChanged: (value) {
          setState(() {
            darkMode = value;
          });
        },
      ),
    );
  }

  Positioned carouselSlider(BuildContext context) {
    return Positioned(
      bottom: 0,
      height: MediaQuery.of(context).size.height * 0.7,
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          height: 600.0,
          aspectRatio: 16 / 9,
          viewportFraction: 0.70,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          },
        ),
        items: movies
            .map(
              (movie) => Builder(builder: (context) {
                return ItemMovie(movie: movie, darkMode: darkMode);
              }),
            )
            .toList(),
      ),
    );
  }
}
