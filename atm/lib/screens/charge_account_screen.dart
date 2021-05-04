import 'package:atm/account/account.dart';
import 'package:atm/account/account_manger.dart';
import 'package:atm/helpers/api_response.dart';
import 'package:atm/widgets/credit_card.dart';
import 'package:atm/widgets/custom_button.dart';
import 'package:atm/widgets/custom_text_form.dart';
import 'package:atm/widgets/messenger.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChargeAccountScreen extends StatelessWidget {
  Account account;
  ChargeAccountScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    account = context.watch<AccountManager>().account;

    final loading = context.watch<AccountManager>().loading;
    final _contollerBalance = TextEditingController();
    final primaryColor = Theme.of(context).primaryColor;
    final accentColor = Theme.of(context).accentColor;

    _onClickDeposit() async {
      if (_contollerBalance.text.isNotEmpty) {
        int currentAccount = account.id;
        num balance = int.parse(_contollerBalance.text);

        ApiResponse apiResponse = await context.read<AccountManager>().deponsit(
              currentAccount: currentAccount,
              balance: balance,
            );

        if (apiResponse.ok) {
          messenger(context, "Deposito realizada com sucesso");
        } else {
          messenger(context, apiResponse.msg, error: true);
        }
      } else {
        messenger(context, "Preencha  valor ", error: true);
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Carregar conta"),
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
                  SizedBox(height: 40),
                  Align(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SizedBox(height: 20),
                        Text("Valor"),
                        SizedBox(height: 10),
                        CustomTextForm(
                          icon: Icons.attach_money,
                          controller: _contollerBalance,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 90),
                  CustomButton(
                    onPressed: _onClickDeposit,
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
                    "${account.balance ?? 0},00 KZ",
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
