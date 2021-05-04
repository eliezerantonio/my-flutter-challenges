import 'dart:ui';

import 'package:atm/account/account.dart';
import 'package:atm/account/account_manger.dart';
import 'package:atm/helpers/api_response.dart';
import 'package:atm/widgets/credit_card.dart';
import 'package:atm/widgets/custom_button.dart';
import 'package:atm/widgets/custom_text_form.dart';
import 'package:atm/widgets/messenger.dart';
import 'package:atm/widgets/stain_images_widget.dart';
import 'package:atm/widgets/stain_images_widget2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServicesScreen extends StatefulWidget {
  ServicesScreen({Key key, this.name}) : super(key: key);
  final String name;

  @override
  _ServicesScreenState createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  String _opcionSeleccionada;
  String _opcionSeleccionada2;

  Account account;

  List<String> _poderes = [
    'SMS',
    'VOZ',
    'NET',
  ];
  List<String> _plains = [
    '1000KZ',
    '1500KZ',
    '2000KZ',
    '2500KZ',
    '3000KZ',
  ];

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
              child: Text("Recargas"),
            ),
            titleTextStyle: TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 25),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
                      await context.read<AccountManager>().sendMoney(
                            sendAccount: sendAccount,
                            currentAccount: currentAccount,
                            balance: balance,
                          );

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
        title: Text("Recargas"),
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
                  StainImageWidget2(
                    image: "${widget.name}",
                    name: "${widget.name}",
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _crearDropdown(),
                        SizedBox(height: 20),
                        _crearDropdown2(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Numero"),
                        SizedBox(height: 10),
                        CustomTextForm(
                          icon: Icons.phone,
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

  List<DropdownMenuItem<String>> getOpcionesDropdown() {
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  List<DropdownMenuItem<String>> getOpcionesDropdown2() {
    List<DropdownMenuItem<String>> lista = new List();

    _plains.forEach((poder) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: <Widget>[
          Expanded(
            child: DropdownButton(
              value: _opcionSeleccionada,
              hint: Text("Selecione o Pacote"),
              elevation: 0,
              isExpanded: true,
              items: getOpcionesDropdown(),
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada = opt;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _crearDropdown2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        children: <Widget>[
          Expanded(
            child: DropdownButton(
              hint: Text("Selecione o Pacote"),
              value: _opcionSeleccionada2,
              elevation: 0,
              isExpanded: true,
              items: getOpcionesDropdown2(),
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada2 = opt;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
