import 'package:flutter/material.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/screens/movie_details/details_movie_screen.dart';
import 'package:nicolau/widgets/custom_widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ItemMovie extends StatelessWidget {
  const ItemMovie({Key? key, this.darkMode = false, required this.movie})
      : super(key: key);
  final bool darkMode;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final percent = ((movie.voteAverage * 100) / 10);
    movie.uiniqueId = '${movie.id}-card';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),
            pageBuilder: (_, __, ___) =>
                DetailsMovieScreen(movie: movie, darkMode: darkMode),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: darkMode ? Colors.black : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                children: [
                  const SizedBox(height: 20),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 1000),
                    height: 300,
                    child: Hero(
                        tag: movie.uiniqueId,
                        child: FadeInImage(
                          image: NetworkImage(movie.getPosterImg()),
                          placeholder: const AssetImage('assets/no-image.jpg'),
                          fit: BoxFit.cover,
                        )),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: !darkMode ? Colors.black : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      movie.title,
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        color: !darkMode ? Colors.grey[850] : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  typeMovie(movie.releaseDate),
                  const SizedBox(height: 20),
                ],
              ),
              Positioned(
                bottom: 82,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.circular(30)),
                  child: CircularPercentIndicator(
                    radius: 45.0,
                    animation: true,
                    lineWidth: 4.0,
                    animateFromLastPercent: true,
                    animationDuration: 1000,
                    percent: (movie.voteAverage * 0.1),
                    center: Text(
                      "${percent.toStringAsFixed(0)}%",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    progressColor: getColor(percent),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MaterialColor getColor(double percent) {
    if (percent > 66) {
      return Colors.green;
    } else if (percent < 50) {
      return Colors.red;
    } else {
      return Colors.yellow;
    }
  }

  Row stars() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Icon(
          Icons.star_border,
          color: Colors.grey,
          size: 18,
        ),
      ],
    );
  }

  Container typeMovie(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: !darkMode ? Colors.grey[850] : Colors.white,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
