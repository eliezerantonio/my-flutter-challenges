import 'dart:math';
import 'package:clippy_flutter/point.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';

class PointCustom extends StatelessWidget {
  const PointCustom({
    Key key,
    this.alignmentGeometry = Alignment.topRight,
    this.height = 150,
    this.width = 100,
  }) : super(key: key);
  final AlignmentGeometry alignmentGeometry;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentGeometry,
      child: Point(
        triangleHeight: 30.0,
        edge: Edge.LEFT,
        child: Container(
          color: Colors.grey[200],
          width: 135.0,
          height: 200.0,
        ),
      ),
    );
  }
}
