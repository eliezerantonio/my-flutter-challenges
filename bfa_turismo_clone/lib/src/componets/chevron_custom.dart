import 'dart:math';

import 'package:clippy_flutter/chevron.dart';
import 'package:flutter/material.dart';

class ChevronCustom extends StatelessWidget {
  const ChevronCustom({Key key, this.edge = Edge.LEFT}) : super(key: key);
  final Edge edge;
  @override
  Widget build(BuildContext context) {
    return Chevron(
      triangleHeight: 85.0,
      edge: edge,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/chevron_demo'),
        child: Container(
          width: 150,
          height: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              image: DecorationImage(
                image: AssetImage("images/firstImage.gif"),
                fit: BoxFit.fill,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 8,
                  color: Colors.black12,
                  offset: Offset(-10, 4),
                )
              ]),
          transform: Matrix4.rotationZ(-5 * pi / 280)..translate(-2.0),
        ),
      ),
    );
  }
}
