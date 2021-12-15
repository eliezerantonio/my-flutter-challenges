import 'package:flutter/material.dart';

class CircularBackground extends StatelessWidget {
  const CircularBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Positioned(
          right: -(size.width) * 1.1,
          top: -(size.width) * 0.4,
          child: Container(
            width: size.height * 0.9,
            height: size.height * 0.9,
            decoration: BoxDecoration(
              color: Color.fromRGBO(239, 239, 239, 1.00),
              borderRadius: BorderRadius.circular(2000),
            ),
          ),
        )
      ],
    );
  }
}
