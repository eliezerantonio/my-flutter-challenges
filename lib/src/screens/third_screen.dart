import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Image.asset(
          "images/thirdImage.png",
          height: double.infinity,
          width: double.maxFinite,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
