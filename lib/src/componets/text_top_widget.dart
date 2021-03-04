import 'package:flutter/material.dart';

class TextTopWidget extends StatelessWidget {
  TextTopWidget(
      {Key key,
      @required this.text,
      @required this.color,
      this.top = 0.0,
      this.bottom = 0.0,
      this.fontSize = 25});
  final String text;
  final Color color;
  final double top;
  final double bottom;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: top, left: 20, right: 1, bottom: bottom),
      child: Text(
        text,
        style: TextStyle(
            color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
      ),
    );
  }
}
