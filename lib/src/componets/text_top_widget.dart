import 'package:flutter/material.dart';

class TextTopWidget extends StatelessWidget {
  const TextTopWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        15,
      ),
      margin: EdgeInsets.only(top: 100, left: 15),
      child: Text(
        "BFA Turismo",
        style: TextStyle(
            color: Colors.grey[600], fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
