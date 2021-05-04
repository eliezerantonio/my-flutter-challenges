import 'package:flutter/material.dart';

class StainImageWidget2 extends StatelessWidget {
  StainImageWidget2({@required this.image, @required this.name});
  final String image;
  final String name;
  String _escolhaUsuario;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[100],
            ),
          ),
          Container(
            width: 170,
            height: 170,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/$image.png",
                  width: 100,
                  height: 100,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(name.toUpperCase())
              ],
            ),
          )
        ],
      ),
    );
  }
}
