import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nicolau/bloc_navigation/bloc_navigation.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/providers/movie_provider.dart';
import 'package:nicolau/utils/myBackgroundColors.dart';
import 'package:nicolau/utils/responsive.dart';
import 'package:nicolau/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/item_movie.dart';

class HomeScreen extends StatefulWidget with NavigationStates {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;

  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    final movies = Provider.of<MoviesProvider>(context).populares;
    return Scaffold(
      body: SafeArea(
        child: movies.isNotEmpty
            ? SizedBox(
                height: responsive.hp(100),
                width: responsive.wp(100),
                child: Stack(
                  children: [
                    FadeInImage(
                      image: NetworkImage(movies[_current].getPosterImg()),
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      fit: BoxFit.cover,
                      height: responsive.hp(100),
                      width: responsive.wp(100),
                    ),
                    // backround color
                    BackgroundGradiante(
                      darkMode: darkMode,
                      backgroundDarkMode: backgroundDarkMode,
                      backgroundWhiteMode: backgroundWhiteMode,
                    ),

                    //carousel movies
                    carouselSlider(context, movies, responsive),
                  ],
                ),
              )
            : _shimmer(responsive),
      ),
    );
  }

  Shimmer _shimmer(Responsive responsive) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: true,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            bottom: 0,
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  height: responsive.hp(50),
                  width: responsive.wp(60),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: responsive.hp(70),
                  width: responsive.wp(60),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: responsive.hp(50),
                  width: responsive.wp(60),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Positioned carouselSlider(
      BuildContext context, List<Movie> movies, Responsive responsive) {
    return Positioned(
      bottom: 0,
      height: responsive.hp(70),
      width: responsive.wp(100),
      child: CarouselSlider(
        options: CarouselOptions(
          height: responsive.hp(65),
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
                return ItemMovie(
                  movie: movie,
                );
              }),
            )
            .toList(),
      ),
    );
  }
}
