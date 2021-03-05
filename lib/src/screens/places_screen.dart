import 'dart:async';

import 'package:bfa_turismo/src/componets/place_odd_widget.dart';
import 'package:bfa_turismo/src/componets/place_pair_widget.dart';
import 'package:bfa_turismo/src/componets/point_custom.dart';
import 'package:bfa_turismo/src/componets/text_top_widget.dart';
import 'package:bfa_turismo/src/componets/triangle_custom.dart';
import 'package:bfa_turismo/src/data/place_data.dart';
import 'package:bfa_turismo/src/models/place.dart';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'place_detail_screen.dart';

enum FilterOptions {
  Favorite,
  All,
}

class PlacesScreen extends StatefulWidget {
  @override
  _PlacesScreenState createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  List<Place> places = DUMMY_PLACES;

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
              height: 154 * places.length + 30.0,
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: places.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PlaceDetailScreen(
                              place: places[i],
                            ),
                          ),
                        );
                      },
                      child: i % 2 == 0
                          ? AnimationLimiter(
                              child: AnimationConfiguration.staggeredList(
                                position: i,
                                duration: const Duration(milliseconds: 1300),
                                child: SlideAnimation(
                                  horizontalOffset: 100.0,
                                  child: FadeInAnimation(
                                    child: PlacepPairWidget(place: places[i]),
                                  ),
                                ),
                              ),
                            )
                          : AnimationLimiter(
                              child: AnimationConfiguration.staggeredList(
                                position: i,
                                duration: const Duration(milliseconds: 1300),
                                child: SlideAnimation(
                                  horizontalOffset: -100.0,
                                  child: FadeInAnimation(
                                    child: PlacepOddWidget(place: places[i]),
                                  ),
                                ),
                              ),
                            ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
