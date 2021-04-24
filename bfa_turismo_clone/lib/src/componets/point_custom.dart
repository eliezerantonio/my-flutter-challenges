import 'dart:math';
import 'package:clippy_flutter/point.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';

class PointCustom extends StatelessWidget {
  const PointCustom(
      {Key key,
      this.alignmentGeometry = Alignment.topRight,
      this.height = 200.0,
      this.width = 100,
      this.opacity = 1.0,
      this.numSize = 200,
      this.edge = Edge.LEFT})
      : super(key: key);
  final AlignmentGeometry alignmentGeometry;
  final double width;
  final double height;
  final Edge edge;
  final int numSize;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentGeometry,
      child: Point(
        triangleHeight: 30.0,
        edge: edge,
        child: Container(
          color: Colors.grey[numSize].withOpacity(opacity),
          width: width,
          height: height,
        ),
      ),
    );
  }
}
