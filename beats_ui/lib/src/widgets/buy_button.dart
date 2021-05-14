import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuyButton extends StatelessWidget {
  const BuyButton(
      {Key key, this.title = "Buy", this.color = Colors.red, this.color2})
      : super(key: key);
  final String title;
  final Color color;
  final int color2;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: Container(
              width: size.width * 0.3,
              height: 60,
              decoration: BoxDecoration(
                color: color == null ? Color(color2) : color,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$title",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Icon(
                    FontAwesomeIcons.arrowRight,
                    color: Colors.white,
                  )
                ],
              )),
        )
      ],
    );
  }
}
