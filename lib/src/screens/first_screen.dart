import 'dart:math';

import 'package:bfa_turismo/src/componets/logo_widget.dart';
import 'package:bfa_turismo/src/componets/text_top_widget.dart';
import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size.width;
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
            bottom: 50,
          ),
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23),
                image: DecorationImage(
                  image: AssetImage("images/firstImage.gif"),
                  fit: BoxFit.fill,
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 8,
                    color: Colors.black12,
                    offset: Offset(-10, 4),
                  )
                ]),
            transform: Matrix4.rotationZ(-5 * pi / 280)..translate(-2.0),
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
