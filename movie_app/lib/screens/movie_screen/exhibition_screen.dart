import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nicolau/bloc_navigation/bloc_navigation.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/providers/movie_provider.dart';
import 'package:nicolau/screens/exhibition/widgets/item_movie.dart';
import 'package:nicolau/shared/widgets/sttaggered_grid_view_movie.dart';
import 'package:nicolau/utils/myBackgroundColors.dart';
import 'package:nicolau/utils/responsive.dart';
import 'package:nicolau/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ExhibitionScreen extends StatefulWidget with NavigationStates {
  const ExhibitionScreen({Key? key}) : super(key: key);

  @override
  _ExhibitionScreenState createState() => _ExhibitionScreenState();
}

class _ExhibitionScreenState extends State<ExhibitionScreen>
    with SingleTickerProviderStateMixin {
  int _current = 0;

  bool carroulse = true;
  final _scrollController = ScrollController();
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    late Animation<double> moveRight;
    late Animation<double> moveLeft;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 300) {
        context.read<MoviesProvider>().getPopulares();
      }
    });

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1500));

    moveRight = Tween(begin: -570.0, end: 570.0).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);

    final movies = Provider.of<MoviesProvider>(context).now_playings;
    return Scaffold(
      body: SafeArea(
        child: movies.isNotEmpty
            ? GestureDetector(
                onDoubleTap: () {
                  carroulse = !carroulse;
                  setState(() {});
                },
                child: SizedBox(
                  height: responsive.hp(100),
                  width: responsive.wp(100),
                  child: Stack(
                    children: [
                      //carousel

                      if (carroulse) ...[
                        CachedNetworkImage(
                          height: responsive.hp(100),
                          width: responsive.wp(100),
                          imageUrl: movies[_current].getPosterImg(),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Image.asset(
                            "assets/no-image.jpg",
                            fit: BoxFit.cover,
                          ),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.cover,
                        ),
                        // backround color
                        BackgroundGradiante(
                          darkMode: false,
                          backgroundDarkMode: backgroundDarkMode,
                          backgroundWhiteMode: backgroundWhiteMode,
                        ),
                      ],
                      //carousel movies
                      carroulse
                          ? carouselSlider(context, movies, responsive)
                          : StaggeredGridViewMovie(
                              scrollController: _scrollController,
                              movies: movies),
                    ],
                  ),
                ),
              )
            : CircularProgressIndicator(),
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
      child: FadeInUp(
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
      ),
    );
  }
}
