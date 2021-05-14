import 'package:beats_ui/src/widgets/buy_button.dart';
import 'package:beats_ui/src/widgets/cards_view.dart';
import 'package:beats_ui/src/widgets/circular_background.dart';
import 'package:beats_ui/src/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CircularBackground(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  _Header(),
                  CardsView(),
                ],
              ),
            ),
          ),
          BuyButton(
            title: "Buy",
          ),
          Positioned(
            left: 20,
            bottom: 0,
            child: SizedBox(
              width: 300,
              height: 150,
              child: ListView(
                children: [
                  Text(
                    "Popular Beats Products",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BeatsSmall(
                    color: Colors.blueAccent,
                    img: "gold",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BeatsSmall(
                    color: Colors.blueGrey,
                    img: "red",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BeatsSmall(
                    color: Colors.grey,
                    img: "blue",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BeatsSmall(
                    color: Colors.blueAccent,
                    img: "gold",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BeatsSmall(
                    color: Colors.blueGrey,
                    img: "red",
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  BeatsSmall(
                    color: Colors.grey,
                    img: "blue",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BeatsSmall extends StatelessWidget {
  const BeatsSmall({Key key, this.color = Colors.white, this.img = "black"})
      : super(key: key);
  final String img;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 70,
          height: 70,
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10)),
          child: Image.asset(
            "assets/$img.png",
            width: 20,
            height: 20,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "The decade Collection",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text("\$300"),
          ],
        )
      ],
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 35,
          ),
          Text(
            "Beats",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            "By Dre",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
