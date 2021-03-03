import 'dart:math';

import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';

class TriangleCustom extends StatelessWidget {
  const TriangleCustom(
      {Key key,
      this.alignmentGeometry = Alignment.topCenter,
      this.height = 135,
      this.width = 100,
      this.edge = Edge.TOP})
      : super(key: key);
  final AlignmentGeometry alignmentGeometry;
  final double width;
  final double height;
  final Edge edge;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentGeometry,
      child: Triangle.isosceles(
        edge: edge,
        child: Container(
          color: Colors.grey[100],
          transform: Matrix4.rotationZ(-2 * pi / 280)..translate(-2.0),
          width: width,
          height: height,
        ),
      ),
    );
  }
}
