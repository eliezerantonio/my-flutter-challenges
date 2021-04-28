import 'package:flutter/material.dart';

class CardTotalMoney extends StatelessWidget {
  const CardTotalMoney({Key key, this.balance}) : super(key: key);
  final num balance;
  @override
  Widget build(BuildContext context) {
    final accentColor = Theme.of(context).accentColor;
    final primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: 200,
        alignment: Alignment.center,
        height: 90,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Saldo Actual",
              style: TextStyle(
                color: primaryColor,
              ),
            ),
            Text(
              "$balance,00 Kz",
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
