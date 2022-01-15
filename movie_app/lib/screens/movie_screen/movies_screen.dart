import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nicolau/bloc_navigation/bloc_navigation.dart';
import 'package:nicolau/data/movies.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/providers/movie_provider.dart';
import 'package:nicolau/utils/myBackgroundColors.dart';
import 'package:nicolau/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';

import 'widgets/item_movie.dart';

class HomeScreen extends StatefulWidget with NavigationStates {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  bool darkMode = false;
  bool drawerOpen = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final movies = Provider.of<MoviesProvider>(context).populares;
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              // Image.network(movies[_current].getPosterImg(), fit: BoxFit.cover),
              //backround color
              BackgroundGradiante(
                darkMode: darkMode,
                backgroundDarkMode: backgroundDarkMode,
                backgroundWhiteMode: backgroundWhiteMode,
              ),

              //carousel movies
              carouselSlider(context, movies),

              //switch dark and white mode
              buttonDarkMode(),
              AnimatedContainer(
                height: MediaQuery.of(context).size.height,
                width:
                    !drawerOpen ? 0 : MediaQuery.of(context).size.height * 0.4,
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                duration: const Duration(milliseconds: 300),
              ),
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

  Positioned carouselSlider(BuildContext context, List<Movie> movies) {
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
