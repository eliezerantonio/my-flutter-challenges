import 'package:bfa_turismo/src/componets/text_top_widget.dart';
import 'package:bfa_turismo/src/models/place.dart';
import 'package:flutter/material.dart';

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
            flex: 2,
            child: Container(
              child: Image.network(
                place.imageUrl,
                fit: BoxFit.cover,
                height: 150,
              ),
            ),
          ),
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
