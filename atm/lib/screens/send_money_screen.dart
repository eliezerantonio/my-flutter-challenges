import 'package:atm/account/account.dart';
import 'package:atm/account/account_manger.dart';
import 'package:atm/widgets/credit_card.dart';
import 'package:atm/widgets/custom_button.dart';
import 'package:atm/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SendMoneyScreen extends StatefulWidget {
  const SendMoneyScreen({Key key}) : super(key: key);

  @override
  _SendMoneyScreenState createState() => _SendMoneyScreenState();
}

class _SendMoneyScreenState extends State<SendMoneyScreen> {
  var account;
  @override
  void initState() {
    super.initState();
    account = context.read<AccountManager>().getAccount(userId: 1);
  }

  @override
  Widget build(BuildContext context) {
    account = context.watch<AccountManager>().account;

    final loading = context.watch<AccountManager>().loading;
    final _contollerAccount = TextEditingController();
    final _contollerBalance = TextEditingController();
    final primaryColor = Theme.of(context).primaryColor;
    final accentColor = Theme.of(context).accentColor;
    _onClickSend() {
      int currentAccount = account.id;
      int sendAccount = int.parse(_contollerAccount.text);
      num balance = int.parse(_contollerBalance.text);

      context.read<AccountManager>().sendMoney(
            currentAccount: currentAccount,
            sendAccount: sendAccount,
            balance: balance,
          );
    }

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
                    if (loading)
                      LinearProgressIndicator(
                        backgroundColor: accentColor,
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor),
                      ),
                    MyCreditCard(),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Numero de conta"),
                          SizedBox(height: 10),
                          CustomTextForm(
                            icon: Icons.call_missed_rounded,
                            controller: _contollerAccount,
                            showPrefix: true,
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
                          CustomTextForm(
                            icon: Icons.attach_money,
                            controller: _contollerBalance,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 70),
                    CustomButton(
                      onPressed: _onClickSend,
                      text: "Confirmar",
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
        ));
  }
}
