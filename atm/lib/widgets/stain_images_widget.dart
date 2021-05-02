import 'package:flutter/material.dart';

class StainImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[100],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/unitel.png",
                width: 80,
                height: 80,
              ),
              SizedBox(
                height: 10,
              ),
              Text("Unitel")
            ],
          )
        ],
      ),
    );
  }
}
