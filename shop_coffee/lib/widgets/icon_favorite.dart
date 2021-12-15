import 'package:flutter/material.dart';

class IconFavorite extends StatelessWidget {
  IconFavorite({Key key, this.opacity = 1}) : super(key: key);
  double opacity;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.only(
        left: 36,
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Icon(Icons.favorite,
            size: 30,
            color: Color.fromRGBO(
              154,
              73,
              0,
              opacity,
            )),
      ),
    );
  }
}
