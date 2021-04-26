import 'package:atm/account/account_manger.dart';
import 'package:atm/widgets/credit_card.dart';
import 'package:atm/widgets/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final account = context.watch<AccountManager>().account;
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Transferência"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyCreditCard(),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Numero de conta"),
                        SizedBox(height: 10),
                        Container(
                          width: 340,
                          alignment: Alignment.center,
                          height: 50,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(color: primaryColor),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.call_missed_rounded,
                                  color: primaryColor,
                                ),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.all(20),
                                errorMaxLines: 1,
                                labelStyle: TextStyle(color: primaryColor),
                                hintStyle: TextStyle(color: primaryColor)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Valor"),
                        SizedBox(height: 10),
                        Container(
                          width: 340,
                          alignment: Alignment.center,
                          height: 50,
                          child: TextFormField(
                            style: TextStyle(color: primaryColor),
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.attach_money_sharp,
                                  color: primaryColor,
                                ),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding: EdgeInsets.all(20),
                                errorMaxLines: 1,
                                labelStyle: TextStyle(color: primaryColor),
                                hintStyle: TextStyle(color: primaryColor)),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[100],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                  Container(
                    height: 47,
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      textColor: Colors.white,
                      color: primaryColor,
                      onPressed: () {},
                      child: Text("Confirmar"),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(top: 30, right: 40),
              child: Column(
                children: [
                  Text(
                    "Saldo Actual",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "${account.balance},00 KZ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
