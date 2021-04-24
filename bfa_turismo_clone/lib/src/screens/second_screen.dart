import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          "images/secondImage.png",
          height: double.infinity,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
