import 'package:flutter/material.dart';
import 'package:nicolau/models/movie_model.dart';
import 'package:nicolau/screens/movie_details/details_movie_screen.dart';
import 'package:nicolau/widgets/custom_widgets.dart';

class ItemMovie extends StatelessWidget {
  const ItemMovie({Key? key, this.darkMode = false, required this.movie})
      : super(key: key);
  final bool darkMode;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              const SizedBox(height: 20),
              AnimatedContainer(
                duration: const Duration(milliseconds: 1000),
                height: 300,
                child: Hero(
                    tag: movie.id,
                    child:
                        Image.network(movie.getPosterImg(), fit: BoxFit.cover)),
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: !darkMode ? Colors.black : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                    color: !darkMode ? Colors.grey[850] : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  typeMovie("Action"),
                  const SizedBox(width: 7),
                  typeMovie("Drama"),
                  const SizedBox(width: 7),
                  typeMovie("History"),
                ],
              ),
              const SizedBox(height: 10),
              stars(),
              const SizedBox(height: 10),
              const CustomButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
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
          fontSize: 10,
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
