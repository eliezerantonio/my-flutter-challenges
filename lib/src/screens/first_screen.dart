import 'dart:math';

import 'package:bfa_turismo/src/componets/logo_widget.dart';
import 'package:bfa_turismo/src/componets/text_top_widget.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTopWidget(
            text: "BFA Turismo",
            color: Colors.grey[600],
            top: 80,
          ),
          TextTopWidget(
            text: "O FOMENTO \nAO TURISMO\nPASSA POR AQUI.",
            color: Colors.orange[800],
            top: 7,
            fontSize: 36,
            bottom: 37,
          ),
          Container(
            width: double.infinity,
            height: 250,
            transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                  image: AssetImage("images/allplaces.png"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(7),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.transparent,
                    offset: Offset(-10, 6),
                  )
                ]),
          ),
          SizedBox(
            height: 50,
          ),
          Flexible(child: LogoWidget())
        ],
      ),
    );
  }
}
