import 'package:bfa_turismo/src/models/place.dart';
import 'package:flutter/material.dart';

class IconFavoriteCustom extends StatelessWidget {
  const IconFavoriteCustom({
    Key key,
    @required this.place,
  }) : super(key: key);

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 135,
      padding: EdgeInsets.only(right: 10),
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 8,
                color: Colors.black26,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: Icon(
            !place.isFavorite ? Icons.favorite_border : Icons.favorite,
            size: 35,
            color: Colors.orange[800],
          ),
        ),
      ),
    );
  }
}
