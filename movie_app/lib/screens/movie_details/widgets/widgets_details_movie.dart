import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/screens/movie_details/details_movie_screen.dart';

class ActorWidget extends StatelessWidget {
  final image;
  final actor;
  final bool darkMode;

  const ActorWidget({Key? key, this.image, this.actor, this.darkMode = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: const AssetImage('assets/no-image.jpg'),
              height: 100.0,
              fit: BoxFit.cover,
              image: NetworkImage(
                image,
              ),
            ),
          ),
          const SizedBox(height: 7),
          Text(
            actor,
            style: TextStyle(
              color: !darkMode ? Colors.grey[850] : Colors.white,
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}

Row classificationWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      FadeInUpBig(
        duration: const Duration(milliseconds: 500),
        child: const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
      ),
      FadeInUpBig(
        delay: const Duration(milliseconds: 2),
        duration: const Duration(milliseconds: 750),
        child: const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
      ),
      FadeInUpBig(
        delay: const Duration(milliseconds: 2),
        duration: const Duration(milliseconds: 1200),
        child: const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
      ),
      FadeInUpBig(
        delay: const Duration(milliseconds: 2),
        duration: const Duration(milliseconds: 1450),
        child: const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
      ),
      FadeInUpBig(
        delay: const Duration(milliseconds: 2),
        duration: const Duration(milliseconds: 1750),
        child: const Icon(
          Icons.star_border,
          color: Colors.grey,
          size: 18,
        ),
      ),
    ],
  );
}

FadeInUpBig informationMovie(bool darkMode) {
  return FadeInUpBig(
    delay: const Duration(milliseconds: 3),
    duration: const Duration(milliseconds: 2000),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter homines, aliter philosophos loqui putas oportere? Urgent tamen et nihil remittunt. Aut unde est hoc contritum vetustate proverbium: quicum in tenebris? Facit enim ille duo seiuncta ultima bonorum, quae ut essent vera, coniungi debuerunt; Neque solum ea communia, verum etiam paria esse dixerunt. Et homini, qui ceteris animantibus plurimum praestat, praecipue a natura nihil datum esse dicemus? Et hercule-fatendum est enim, quod sentio -mirabilis est apud illos contextus rerum. Duo Reges: constructio interrete.",
        style: TextStyle(
          color: !darkMode ? Colors.grey[850] : Colors.white,
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

FadeInUpBig infoWidget(String text, bool darkMode) {
  return FadeInUpBig(
    delay: const Duration(milliseconds: 3),
    duration: const Duration(milliseconds: 2000),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 4),
      child: Text(
        text,
        style: TextStyle(
          color: !darkMode ? Colors.grey[850] : Colors.white,
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
      child: Image.network(
        movie.getPosterImg(),
        height: 400,
      ),
    ),
  );
}
