import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nocinema/models/movie_model.dart';

informationMovie(String text) {
  return SingleChildScrollView(
    physics: BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        text,
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

Padding infoWidget(
  String text,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
    child: Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        color: Colors.grey[850],
        fontWeight: FontWeight.bold,
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
