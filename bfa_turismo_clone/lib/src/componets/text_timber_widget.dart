import 'package:flutter/material.dart';

class TextTimberWidget extends StatelessWidget {
  const TextTimberWidget({
    Key key,
    @required this.place,
    @required this.title,
  }) : super(key: key);

  final String place;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      "$title: $place",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
    );
  }
}
