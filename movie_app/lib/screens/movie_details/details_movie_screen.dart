import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nicolau/widgets/custom_widgets.dart';

import 'widgets/widgets_details_movie.dart';

class DetailsMovieScreen extends StatefulWidget {
  final movie;
  final bool darkMode;

  const DetailsMovieScreen({Key? key, this.movie, this.darkMode = false})
      : super(key: key);

  @override
  State<DetailsMovieScreen> createState() => _DetailsMovieScreenState();
}

class _DetailsMovieScreenState extends State<DetailsMovieScreen> {
  late final movie;
  late final darkMode;

  @override
  void initState() {
    super.initState();
    movie = widget.movie;
    darkMode = widget.darkMode;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: !darkMode ? Colors.black : Colors.grey[900],
          child: Stack(
            children: [
              //image movie
              imageMovieWidget(movie),
              //icon or close screen
              iconCloseDetailScreen(context),
              Positioned(
                bottom: 0,
                child: Container(
                  width: size.width,
                  height: size.height * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: !darkMode ? Colors.white : Colors.black,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      //title movie
                      titleMovieWidget(movie, darkMode),
                      const SizedBox(height: 7),
                      //type movies, action, history etc..
                      typeMovieWidget(),
                      const SizedBox(height: 10),
                      //stars
                      classificationWidget(),

                      //director name
                      Center(child: Text(movie["diretor"])),
                      const SizedBox(height: 20),

                      //text actores
                      infoWidget("actores", darkMode),
                      //actors list
                      actorsWidget(),
                      //text info

                      infoWidget("History", darkMode),

                      //about movie
                      Expanded(
                        child: informationMovie(darkMode),
                      ),
                      const CustomButton(),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
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

  Center titleMovieWidget(movie, bool darkMode) {
    return Center(
      child: Text(
        widget.movie["title"],
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 20,
          color: !darkMode ? Colors.grey[850] : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Expanded actorsWidget() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (_, index) {
            final image = movie["images"][index];
            final actor = movie["actores"][index];
            return FadeInUpBig(
              delay: const Duration(milliseconds: 3),
              duration: const Duration(milliseconds: 2000),
              child:
                  ActorWidget(actor: actor, image: image, darkMode: darkMode),
            );
          },
        ),
      ),
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
