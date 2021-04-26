import 'package:atm/widgets/credit_card.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: MyCreditCard(),
      ),
    );
  }
}
