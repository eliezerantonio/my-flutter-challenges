import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/screens/movie_details/details_movie_screen.dart';
import 'package:nicolau/shared/widgets/percent_widget.dart';
import 'package:nicolau/utils/responsive.dart';

class StaggeredGridViewMovie extends StatelessWidget {
  const StaggeredGridViewMovie({
    Key? key,
    required ScrollController scrollController,
    required this.movies,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: StaggeredGridView.countBuilder(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          crossAxisCount: 4,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index) =>
              _StaggeredItem(movie: movies[index]),
          staggeredTileBuilder: (int index) =>
              StaggeredTile.count(2, index.isEven ? 2 : 3),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}

class _StaggeredItem extends StatelessWidget {
  final Movie movie;

  const _StaggeredItem({Key? key, required this.movie}) : super(key: key);
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
            margin: const EdgeInsets.only(bottom: 20),
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
                  child: CachedNetworkImage(
                    imageUrl: movie.getPosterImg(),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Image.asset(
                      "assets/no-image.jpg",
                      fit: BoxFit.cover,
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
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
}
