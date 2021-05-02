import 'package:atm/account/account.dart';
import 'package:atm/account/account_manger.dart';
import 'package:atm/helpers/api_response.dart';
import 'package:atm/helpers/nav.dart';
import 'package:atm/widgets/credit_card.dart';
import 'package:atm/widgets/custom_button.dart';
import 'package:atm/widgets/custom_text_form.dart';
import 'package:atm/widgets/messenger.dart';
import 'package:atm/widgets/stain_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatelessWidget {
  Account account;
  PaymentScreen({Key key}) : super(key: key);

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

        ApiResponse apiResponse = await context.read<AccountManager>().raise(
              currentAccount: currentAccount,
              balance: balance,
            );

        if (apiResponse.ok) {
          messenger(context, "Levantamento realizado com sucesso");
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
        title: Text("Pagamentos"),
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
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: SizedBox(
                      width: 150,
                      height: 100,
                      child: GridView(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: StainWidget(
                              icon: Icons.file_upload,
                              title: "Enviar",
                              subtitle: "Enviar dinheiro",
                              color: Colors.red[100],
                              colorIcon: Colors.red,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: StainWidget(
                              icon: Icons.file_download,
                              title: "Carregar",
                              subtitle: "Carregar Conta",
                              color: Colors.green[100],
                              colorIcon: Colors.green,
                            ),
                          ),
                          StainWidget(
                            icon: Icons.search,
                            title: "Consultar",
                            subtitle: "Consultar dados",
                            color: Colors.indigo[100],
                            colorIcon: Colors.indigo,
                          ),
                          GestureDetector(
                            onTap: () {
                              push(context, PaymentScreen());
                            },
                            child: StainWidget(
                              icon: Icons.attach_money_sharp,
                              title: "Pagamentos",
                              subtitle: "Contas",
                              color: Colors.amber[100],
                              colorIcon: Colors.amber,
                            ),
                          ),
                          StainWidget(
                            icon: Icons.shopping_cart_outlined,
                            title: "Compras",
                            subtitle: "Compras online",
                            color: Colors.lightBlue[100],
                            colorIcon: Colors.lightBlue,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: StainWidget(
                              icon: Icons.trending_up_rounded,
                              title: "Levantar",
                              subtitle: "Levantar dinheiro",
                              color: Colors.pinkAccent[100],
                              colorIcon: Colors.pinkAccent,
                            ),
                          ),
                        ],
                      ),
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
