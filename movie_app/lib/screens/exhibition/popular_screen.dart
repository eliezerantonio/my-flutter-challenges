// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nicolau/bloc_navigation/bloc_navigation.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/providers/movie_provider.dart';
import 'package:nicolau/screens/movie_details/details_movie_screen.dart';
import 'package:nicolau/shared/widgets/percent_widget.dart';
import 'package:nicolau/utils/myBackgroundColors.dart';
import 'package:nicolau/utils/responsive.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class PopularScreen extends StatefulWidget with NavigationStates {
  @override
  State<PopularScreen> createState() => _PopularScreenState();
}

class _PopularScreenState extends State<PopularScreen> {
  final List<int> items = List.generate(200, (index) => index);
  final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        context.read<MoviesProvider>().getPopulares();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final playing = context.watch<MoviesProvider>().populares;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        controller: _scrollController,
        crossAxisCount: 4,
        itemCount: playing.length,
        itemBuilder: (BuildContext context, int index) =>
            _PinterestItem(movie: playing[index]),
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(2, index.isEven ? 2 : 3),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }
}

class _PinterestItem extends StatelessWidget {
  final Movie movie;

  const _PinterestItem({Key? key, required this.movie}) : super(key: key);
  final BorderRadius borderRadius = const BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );
  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final percent = ((movie.voteAverage * 100) / 10);
    movie.uiniqueId = '${movie.id}-card';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (_, __, ___) => DetailsMovieScreen(
              movie: movie,
            ),
          ),
        );
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 300,
            margin: EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: borderRadius,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                margin: const EdgeInsets.all(8),
                height: 300,
                width: responsive.wp(52),
                child: Hero(
                  tag: movie.uiniqueId,
                  child: FadeInImage(
                    image: NetworkImage(movie.getPosterImg()),
                    placeholder: const AssetImage('assets/no-image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          percentWidget(
              responsive: responsive, percent: percent, movie: movie, value: 1),
        ],
      ),
    );
  }

  Positioned percent(Responsive responsive, double percent) {
    return Positioned(
      bottom: responsive.dp(1),
      child: Container(
        width: responsive.dp(6),
        height: responsive.dp(6),
        decoration: BoxDecoration(
            color: Colors.grey[850],
            borderRadius: BorderRadius.circular(responsive.hp(10))),
        child: CircularPercentIndicator(
          radius: responsive.dp(5),
          animation: true,
          lineWidth: 4.0,
          animateFromLastPercent: true,
          animationDuration: 2000,
          percent: (movie.voteAverage * 0.1),
          center: Text(
            "${percent.toStringAsFixed(0)}%",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: responsive.dp(1.5)),
          ),
          progressColor: getColor(percent),
        ),
      ),
    );
  }

  Padding _title(Responsive responsive) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        movie.title,
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: responsive.dp(2.5),
          color: Colors.grey[850],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
