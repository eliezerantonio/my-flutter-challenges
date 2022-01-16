import 'package:flutter/material.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/screens/movie_details/details_movie_screen.dart';
import 'package:nicolau/utils/myBackgroundColors.dart';
import 'package:nicolau/utils/responsive.dart';
import 'package:nicolau/widgets/custom_widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ItemMovie extends StatelessWidget {
  const ItemMovie({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final percent = ((movie.voteAverage * 100) / 10);
    movie.uiniqueId = '${movie.id}-card';
    //responsive
    final responsive = Responsive.of(context);
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
      child: _itemMovie(context, responsive, percent),
    );
  }

  Widget _itemMovie(
      BuildContext context, Responsive responsive, double percent) {
    return Container(
      width: 380,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
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
                SizedBox(height: responsive.hp(2)),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
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
                        )),
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: responsive.hp(5),
                ),
                Padding(
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
                ),
                SizedBox(height: responsive.hp(1)),
                typeMovie(responsive, movie.releaseDate),
              ],
            ),
            _percent(responsive, percent),
          ],
        ),
      ),
    );
  }

  Positioned _percent(Responsive responsive, double percent) {
    return Positioned(
      bottom: responsive.dp(8.5),
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

  Container typeMovie(Responsive responsive, String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: responsive.wp(3),
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
