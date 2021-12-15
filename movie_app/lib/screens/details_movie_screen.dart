import 'package:flutter/material.dart';

class DetailsMovieScreen extends StatelessWidget {
  final movie;

  const DetailsMovieScreen({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: movie['id'],
                child: Image.network(
                  movie['image'],
                  height: 400,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
