import 'package:flutter/material.dart';

class CardTotalMoney extends StatelessWidget {
  const CardTotalMoney({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      width: 300,
      alignment: Alignment.center,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Balanço total",
            style: TextStyle(
              color: primaryColor,
            ),
          ),
          Text(
            "3.000.000 AOA",
            style: TextStyle(
              color: primaryColor,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: accentColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
