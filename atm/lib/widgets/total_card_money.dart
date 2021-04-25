import 'package:flutter/material.dart';

class CardTotalMoney extends StatelessWidget {
  const CardTotalMoney({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;
    final primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: 350,
        alignment: Alignment.center,
        height: 90,
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
              "60.000 AOA",
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
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
