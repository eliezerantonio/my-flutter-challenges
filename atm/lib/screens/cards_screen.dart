import 'package:atm/widgets/credit_card.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          MyCreditCard(),
          MyCreditCard(),
          MyCreditCard(),
          MyCreditCard(),
          MyCreditCard(),
          MyCreditCard(),
          MyCreditCard(),
          MyCreditCard(),
          MyCreditCard(),
        ],
      ),
    );
  }
}
