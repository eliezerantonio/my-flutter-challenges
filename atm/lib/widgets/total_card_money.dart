import 'package:flutter/material.dart';

class CardTotalMoney extends StatelessWidget {
  const CardTotalMoney({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        alignment: Alignment.center,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Balanço total",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            Text(
              "3.000.000 AOA",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.indigo[200],
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
