import 'package:bfa_turismo/src/componets/text_top_widget.dart';
import 'package:bfa_turismo/src/models/place.dart';
import 'package:flutter/material.dart';

class PlaceWidget extends StatelessWidget {
  const PlaceWidget({this.place});
  final Place place;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            child: Column(
              children: [
                TextTopWidget(
                  text: place.title.toUpperCase(),
                  color: Colors.orange[800],
                ),
                TextTopWidget(
                  text: 'Capital $place.capital'.toUpperCase(),
                  color: Colors.orange[800],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
