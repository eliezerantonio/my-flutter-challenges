import 'dart:io';

import 'package:flutter/material.dart';

class CardSecunday extends StatelessWidget {
  const CardSecunday({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 100,
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 90),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "frappucino",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        "frappucino.pngfrappucino.pngfrappucino.pngfrappucino.",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              Align(
                child: Container(
                  child: Image.asset(
                    "images/frappucino.png",
                    width: 100,
                  ),
                ),
              ),
              Spacer(),
              Container(
                child: Align(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.add_box_rounded,
                      size: 50,
                      color: Color.fromRGBO(
                        154,
                        73,
                        0,
                        1,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
