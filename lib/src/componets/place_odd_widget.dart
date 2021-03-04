import 'package:bfa_turismo/src/componets/point_custom.dart';
import 'package:bfa_turismo/src/componets/rhombus_custom.dart';
import 'package:bfa_turismo/src/componets/text_top_widget.dart';
import 'package:bfa_turismo/src/models/place.dart';
import 'package:clippy_flutter/arc.dart';
import 'package:flutter/material.dart';

import 'icon_favorite_custom.dart';

class PlacepOddWidget extends StatelessWidget {
  const PlacepOddWidget({this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Container(
                  child: Image.asset(
                    place.imageUrl,
                    fit: BoxFit.cover,
                    height: 150,
                    width: double.infinity,
                  ),
                ),
                PointCustom(
                  alignmentGeometry: Alignment.centerLeft,
                  height: 150,
                  numSize: 100,
                  opacity: 0.2,
                  edge: Edge.RIGHT,
                ),
                RhombusCustom(
                  alignmentGeometry: Alignment.bottomRight,
                  height: 80,
                  opacity: 0.4,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: 150,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextTopWidget(
                    fontSize: 16,
                    text: place.title.toUpperCase(),
                    color: Colors.orange[800],
                  ),
                  TextTopWidget(
                    text: 'Capital ${place.capital}'.toUpperCase(),
                    fontSize: 10,
                    color: Colors.orange[800],
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
