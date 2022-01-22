import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/screens/movie_details/details_movie_screen.dart';

FadeInUpBig informationMovie() {
  return FadeInUpBig(
    delay: const Duration(milliseconds: 3),
    duration: const Duration(milliseconds: 2000),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter homines, aliter philosophos loqui putas oportere? Urgent tamen et nihil remittunt. Aut unde est hoc contritum vetustate proverbium: quicum in tenebris? Facit enim ille duo seiuncta ultima bonorum, quae ut essent vera, coniungi debuerunt; Neque solum ea communia, verum etiam paria esse dixerunt. Et homini, qui ceteris animantibus plurimum praestat, praecipue a natura nihil datum esse dicemus? Et hercule-fatendum est enim, quod sentio -mirabilis est apud illos contextus rerum. Duo Reges: constructio interrete.",
        style: TextStyle(
          color: Colors.grey[850],
        ),
      ),
    ),
  );
}

IconButton iconCloseDetailScreen(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.close),
    color: Colors.white,
    iconSize: 30,
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
}

FadeInUpBig infoWidget(
  String text,
) {
  return FadeInUpBig(
    delay: const Duration(milliseconds: 3),
    duration: const Duration(milliseconds: 2000),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.grey[850],
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Align imageMovieWidget(Movie movie) {
  return Align(
    alignment: Alignment.topCenter,
    child: Hero(
      tag: movie.uiniqueId,
      child: CachedNetworkImage(
        height: 400,
        imageUrl: movie.getPosterImg(),
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            Image.asset(
          "assets/no-image.jpg",
          fit: BoxFit.cover,
        ),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
      ),
    ),
  );
}
