import 'package:flutter/material.dart';

class StainImageWidget extends StatelessWidget {
  StainImageWidget({@required this.image, @required this.name});
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[100],
            ),
          ),
          Container(
            width: 150,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/$image.png",
                  width: 90,
                  height: 90,
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
