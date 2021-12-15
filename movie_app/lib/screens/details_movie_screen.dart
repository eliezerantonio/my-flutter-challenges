import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class DetailsMovieScreen extends StatelessWidget {
  final movie;

  const DetailsMovieScreen({Key? key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(movie);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
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
              IconButton(
                icon: const Icon(Icons.close),
                color: Colors.white,
                iconSize: 30,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Positioned(
                bottom: 0,
                child: AnimatedContainer(
                  width: size.width,
                  height: size.height * 0.7,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  duration: const Duration(milliseconds: 400),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        movie["title"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[850],
                          fontWeight: FontWeight.bold,
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
                      Row(
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
                      ),
                      Text(movie["diretor"]),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 3,
                          itemBuilder: (_, index) {
                            final m = movie["actores"][index];
                            return _actorCartao(m);
                          },
                          shrinkWrap: true,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Spacer(),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[850],
                          ),
                          onPressed: () {},
                          child: const Text("BUY TICKET"),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _actorCartao(actor) {
  return Container(
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const FadeInImage(
            placeholder: AssetImage('assets/img/no-image.jpg'),
            height: 150.0,
            fit: BoxFit.cover,
            image: NetworkImage(
              "actor.getFoto()",
            ),
          ),
        ),
        Text(
          actor,
          overflow: TextOverflow.ellipsis,
        )
      ],
    ),
  );
}

Widget actor() {
  return Container(
    child: Column(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: const FadeInImage(
            placeholder: AssetImage('assets/no-image.jpg'),
            height: 150.0,
            fit: BoxFit.cover,
            image: NetworkImage(
              "actor.getFoto()",
            ),
          ),
        ),
        const Text(
          " actor.name",
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
      style: TextStyle(fontSize: 10, color: Colors.grey[850]),
    ),
    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
    decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(30)),
  );
}
