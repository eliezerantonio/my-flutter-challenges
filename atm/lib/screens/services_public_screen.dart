import 'dart:io';
import 'dart:ui';
import 'package:atm/account/account.dart';
import 'package:atm/account/account_manger.dart';
import 'package:atm/helpers/api_response.dart';
import 'package:atm/widgets/custom_button.dart';
import 'package:atm/widgets/custom_text_form.dart';
import 'package:atm/widgets/messenger.dart';
import 'package:atm/widgets/stain_images_widget2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class ServicesPublicScreen extends StatefulWidget {
  ServicesPublicScreen({Key key, this.name}) : super(key: key);
  final String name;

  @override
  _ServicesPublicScreenState createState() => _ServicesPublicScreenState();
}

class _ServicesPublicScreenState extends State<ServicesPublicScreen> {
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
                SizedBox(height: 7),
                Text("Conta"),
                SizedBox(height: 7),
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
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Numero de Conta"),
                        SizedBox(height: 10),
                        CustomTextForm(
                          icon: Icons.format_list_numbered_rtl_outlined,
                          controller: _contollerBalance,
                        ),
                        SizedBox(height: 30),
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
                    onPressed: () async {
                      // String message = "This is a test message!";
                      // List<String> recipents = ["+244924033375", ];

                      // _sendSMS(message, recipents);

                      pdf();
                    },
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

    _poderes.forEach(
      (poder) {
        lista.add(DropdownMenuItem(
          child: Text(poder),
          value: poder,
        ));
      },
    );

    return lista;
  }

  Future<void> pdf() async {
// Create a new PDF document.
    final PdfDocument document = PdfDocument();
// Add a PDF page and draw text.
    document.pages.add().graphics.drawString(
        'Hello World!', PdfStandardFont(PdfFontFamily.helvetica, 12),
        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
        bounds: const Rect.fromLTWH(0, 0, 150, 20));
// Save the document.
    File('HelloWorld.pdf').writeAsBytes(document.save());
// Dispose the document.
    document.dispose();
  }
}
