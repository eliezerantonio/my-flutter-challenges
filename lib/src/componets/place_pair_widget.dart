import 'package:bfa_turismo/src/componets/point_custom.dart';
import 'package:bfa_turismo/src/componets/rhombus_custom.dart';
import 'package:bfa_turismo/src/componets/text_top_widget.dart';
import 'package:bfa_turismo/src/models/place.dart';
import 'package:flutter/material.dart';

import 'icon_favorite_custom.dart';

class PlacepPairWidget extends StatelessWidget {
  const PlacepPairWidget({this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 150,
              decoration: BoxDecoration(color: Colors.grey[300]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextTopWidget(
                    text: place.title.toUpperCase(),
                    color: Colors.orange[800],
                  ),
                  TextTopWidget(
                    text: 'Capital ${place.capital}'.toUpperCase(),
                    fontSize: 12,
                    color: Colors.orange[800],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
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
                  height: 150,
                  numSize: 100,
                  opacity: 0.2,
                ),
                RhombusCustom(
                  alignmentGeometry: Alignment.topLeft,
                  height: 100,
                  opacity: 0.3,
                ),
                IconFavoriteCustom(place: place)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

