import 'package:bfa_turismo/src/models/place.dart';
import 'package:flutter/material.dart';

class IconFavoriteCustom extends StatefulWidget {
  const IconFavoriteCustom(
      {Key key, @required this.place, this.alignment = Alignment.bottomRight})
      : super(key: key);
  final Place place;
  final AlignmentGeometry alignment;

  @override
  _IconFavoriteCustomState createState() => _IconFavoriteCustomState();
}

class _IconFavoriteCustomState extends State<IconFavoriteCustom> {
  void toggleFavorite() {
    setState(() {
      widget.place.isFavorite = !widget.place.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleFavorite,
      child: Container(
        margin: EdgeInsets.only(top: 120),
        padding: EdgeInsets.only(left: 10, right: 10),
        child: Align(
          alignment: widget.alignment,
          child: Container(
            child: Icon(
              !widget.place.isFavorite ? Icons.favorite_border : Icons.favorite,
              color: Colors.orange[800],
            ),
          ),
        ),
      ),
    );
  }
}
