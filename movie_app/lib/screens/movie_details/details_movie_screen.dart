import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nicolau/models/actor_model.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/providers/movie_provider.dart';
import 'package:nicolau/shared/widgets/date_release_widget.dart';
import 'package:nicolau/shared/widgets/percent_widget.dart';
import 'package:nicolau/utils/responsive.dart';
import 'package:nicolau/widgets/custom_widgets.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/widgets_details_movie.dart';

class DetailsMovieScreen extends StatefulWidget {
  final Movie movie;
  final bool darkMode;

  const DetailsMovieScreen(
      {Key? key, required this.movie, this.darkMode = false})
      : super(key: key);

  @override
  State<DetailsMovieScreen> createState() => _DetailsMovieScreenState();
}

class _DetailsMovieScreenState extends State<DetailsMovieScreen> {
  late final Movie movie;

  @override
  void initState() {
    super.initState();
    movie = widget.movie;
    context.read<MoviesProvider>().getCast(movie.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final responsive = Responsive.of(context);
    final percent = ((movie.voteAverage * 100) / 10);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          child: newMethod(context, responsive, percent),
        ),
      ),
    );
  }

  Stack newMethod(BuildContext context, Responsive responsive, double percent) {
    return Stack(
      children: [
        //image movie
        imageMovieWidget(movie),
        //icon for close screen
        iconCloseDetailScreen(context),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: responsive.wp(100),
            height: responsive.hp(80),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                //title movie
                titleMovieWidget(
                  movie,
                ),
                const SizedBox(height: 7),
                Center(
                  child: percentWidget(
                    responsive: responsive,
                    percent: percent,
                    movie: movie,
                  ),
                ),
                const SizedBox(height: 7),
                //type movies, action, history etc..
                typeMovieWidget(),
                const SizedBox(height: 10),
                //stars
                //director name
                Center(child: Text(movie.originalTitle)),
                const SizedBox(height: 20),
                Center(
                    child: dateReleaseWidget(
                        responsive, movie.releaseDate.toString())),
                //text actores
                infoWidget(
                  "Elenco Principal",
                ),
                _crearCasting(movie),

                infoWidget(
                  "Sinopse",
                ),

                //about movie
                Expanded(
                  child: informationMovie(movie.overview),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row typeMovieWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        typeMovie("Action"),
        const SizedBox(width: 7),
        typeMovie("Drama"),
        const SizedBox(width: 7),
        typeMovie("History"),
      ],
    );
  }

  Center titleMovieWidget(
    movie,
  ) {
    return Center(
      child: Text(
        widget.movie.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 20,
          color: Colors.grey[850],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _crearCasting(Movie movie) {
    final actores = context.watch<MoviesProvider>().actores;

    if (actores.isNotEmpty) {
      return _createActoresPageView(actores);
    } else {
      return Expanded(child: _shimmer());
    }
  }

  PageView _shimmer() {
    return PageView.builder(
        physics: const BouncingScrollPhysics(),
        pageSnapping: false,
        controller: PageController(viewportFraction: 0.3, initialPage: 1),
        itemCount: 20,
        itemBuilder: (context, i) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    "assets/no-image.jpg",
                    fit: BoxFit.cover,
                    height: 150,
                  ),
                ),
              ),
            ));
  }

  Widget _createActoresPageView(List<Actor> actores) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        pageSnapping: false,
        controller: PageController(viewportFraction: 0.3, initialPage: 1),
        itemCount: actores.length,
        itemBuilder: (context, i) => _actorCard(actores[i]),
      ),
    );
  }

  Widget _actorCard(Actor actor) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: CachedNetworkImage(
              height: 150,
              imageUrl: actor.getPhoto(),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Image.asset(
                "assets/no-image.jpg",
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            actor.name,
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }

  Container typeMovie(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10,
          color: Colors.grey[850],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
