import 'package:clippy_flutter/rhombus.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';

class RhombusCustom extends StatelessWidget {
  const RhombusCustom({
    Key key,
    this.alignmentGeometry = Alignment.topRight,
    this.height = 200.0,
    this.width = 100,
    this.opacity = 1.0,
    this.numSize = 200,
  }) : super(key: key);
  final AlignmentGeometry alignmentGeometry;
  final double width;
  final double height;
  final int numSize;
  final double opacity;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignmentGeometry,
      child: Rhombus(
        child: Container(
          color: Colors.grey[numSize].withOpacity(opacity),
          width: width,
          height: height,
        ),
      ),
    );
  }
}
