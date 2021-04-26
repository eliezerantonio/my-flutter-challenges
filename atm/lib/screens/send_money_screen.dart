import 'package:atm/account/account_manger.dart';
import 'package:atm/widgets/credit_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final account = context.watch<AccountManager>().account;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: ListView(
          children: [
            Stack(
              children: [
                Align(child: MyCreditCard()),
                Container(
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    "${account.balance},00 KZ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
