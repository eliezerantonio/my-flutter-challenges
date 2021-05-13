import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BuyButton extends StatelessWidget {
  const BuyButton({Key key}) : super(key: key);

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
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Buy",
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
