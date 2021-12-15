import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class DetailsMovieScreen extends StatefulWidget {
  final movie;
  final bool darkMode;

  const DetailsMovieScreen({Key? key, this.movie, this.darkMode = false})
      : super(key: key);

  @override
  State<DetailsMovieScreen> createState() => _DetailsMovieScreenState();
}

class _DetailsMovieScreenState extends State<DetailsMovieScreen> {
  bool end = false;

  @override
  Widget build(BuildContext context) {
    print(widget.movie);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: !widget.darkMode ? Colors.black : Colors.white,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Hero(
                  tag: widget.movie['id'],
                  child: Image.network(
                    widget.movie['image'],
                    height: 400,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                color: !widget.darkMode ? Colors.white : Colors.black,
                iconSize: 30,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
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
                    color: !widget.darkMode ? Colors.white : Colors.black,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          widget.movie["title"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            color: !widget.darkMode
                                ? Colors.grey[850]
                                : Colors.white,
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
                      classification(),
                      Center(child: Text(widget.movie["diretor"])),
                      const SizedBox(height: 20),
                      FadeInUpBig(
                        delay: const Duration(milliseconds: 3),
                        duration: const Duration(milliseconds: 2000),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 4),
                          child: Text("Actors",
                              style: TextStyle(
                                color: !widget.darkMode
                                    ? Colors.grey[850]
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      actors(),
                      FadeInUpBig(
                        delay: const Duration(milliseconds: 3),
                        duration: const Duration(milliseconds: 2000),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 4),
                          child: Text("History",
                              style: TextStyle(
                                color: !widget.darkMode
                                    ? Colors.grey[850]
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Expanded(
                        child: FadeInUpBig(
                          delay: const Duration(milliseconds: 3),
                          duration: const Duration(milliseconds: 2000),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliter homines, aliter philosophos loqui putas oportere? Urgent tamen et nihil remittunt. Aut unde est hoc contritum vetustate proverbium: quicum in tenebris? Facit enim ille duo seiuncta ultima bonorum, quae ut essent vera, coniungi debuerunt; Neque solum ea communia, verum etiam paria esse dixerunt. Et homini, qui ceteris animantibus plurimum praestat, praecipue a natura nihil datum esse dicemus? Et hercule-fatendum est enim, quod sentio -mirabilis est apud illos contextus rerum. Duo Reges: constructio interrete.",
                              style: TextStyle(
                                color: !widget.darkMode
                                    ? Colors.grey[850]
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[850],
                          ),
                          onPressed: () {
                            setState(() {
                              end = !end;
                            });
                          },
                          child: const Text("BUY TICKET"),
                        ),
                      ),
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

  Expanded actors() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (_, index) {
            final image = widget.movie["images"][index];
            final mov = widget.movie["actores"][index];
            return FadeInUpBig(
              delay: const Duration(milliseconds: 3),
              duration: const Duration(milliseconds: 2000),
              child: actorCard(mov, image),
            );
          },
          shrinkWrap: true,
        ),
      ),
    );
  }

  Row classification() {
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

  Widget actorCard(actor, image) {
    return Container(
      margin: EdgeInsets.only(left: 10),
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
          SizedBox(height: 7),
          Text(
            actor,
            style: TextStyle(
              color: !widget.darkMode ? Colors.grey[850] : Colors.white,
            ),
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
          color: !widget.darkMode ? Colors.grey[850] : Colors.white,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
