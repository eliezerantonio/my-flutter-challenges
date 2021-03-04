import 'package:bfa_turismo/src/componets/place_odd_widget.dart';
import 'package:bfa_turismo/src/componets/place_pair_widget.dart';
import 'package:bfa_turismo/src/componets/point_custom.dart';
import 'package:bfa_turismo/src/componets/text_top_widget.dart';
import 'package:bfa_turismo/src/componets/triangle_custom.dart';
import 'package:bfa_turismo/src/data/place_data.dart';
import 'package:bfa_turismo/src/models/place.dart';

import 'package:flutter/material.dart';

enum FilterOptions {
  Favorite,
  All,
}

class PlacesScreen extends StatefulWidget {
  PlacesScreen({Key key}) : super(key: key);

  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  final List<Place> places = DUMMY_PLACES;
  bool _showFavoriteOnly = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          "images/logo.png",
          width: 100,
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Container(
              height: 150,
              padding: EdgeInsets.all(1),
              child: Stack(
                children: [
                  PointCustom(
                    width: 150,
                  ),
                  TriangleCustom(
                    alignmentGeometry: Alignment.bottomLeft,
                    colorNum: 200,
                  ),
                  TriangleCustom(
                    alignmentGeometry: Alignment.centerRight,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextTopWidget(
                          color: Colors.grey[500],
                          fontSize: 17,
                          text: "BFA Turismo",
                        ),
                        TextTopWidget(
                          color: Colors.orange[800],
                          text: "o fomento ao turismo passa por aqui"
                              .toUpperCase(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 152 * places.length + 30.0,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: places.length,
                  itemBuilder: (context, i) {
                    if (i % 2 == 0) {
                      return PlacepPairWidget(place: places[i]);
                    } else {
                      return PlacepOddWidget(place: places[i]);
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
