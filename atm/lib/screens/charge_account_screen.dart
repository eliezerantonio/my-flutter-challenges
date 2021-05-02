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
    final _contollerAccount = TextEditingController();
    final _contollerBalance = TextEditingController();
    final primaryColor = Theme.of(context).primaryColor;
    final accentColor = Theme.of(context).accentColor;

    _onClickSend() async {
      int currentAccount = account.id;
      int sendAccount = int.parse(_contollerAccount.text);
      num balance = int.parse(_contollerBalance.text);

      if (sendAccount == currentAccount) {
        messenger(context, "Operação não suportada!", error: true);
        return;
      }
      showDialog(
        builder: (_) {
          return AlertDialog(
            actionsPadding: EdgeInsets.symmetric(horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            title: Center(
              child: Text("Transferência"),
            ),
            titleTextStyle: TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 25),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Montante",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "$balance,00KZ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 7,
                ),
                Text("Conta"),
                SizedBox(
                  height: 7,
                ),
                Text("0000.0000.$sendAccount"),
              ],
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Cancelar",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  ApiResponse apiResponse =
                      await context.read<AccountManager>().deponsit(
                            currentAccount: currentAccount,
                            balance: balance,
                          );
                  Navigator.of(context).pop();

                  if (apiResponse.ok) {
                    messenger(context, "Transferência realizada com sucesso");
                  } else {
                    messenger(context, apiResponse.msg, error: true);
                  }
                },
                child: Text(
                  "Confirmar",
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          );
        },
        context: context,
      );
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
                    onPressed: _onClickSend,
                    text: "Carregar",
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
