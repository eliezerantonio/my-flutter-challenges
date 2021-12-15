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
    '1000 KZ',
    '1500 KZ',
    '2000 KZ',
    '2500 KZ',
    '3000 KZ',
  ];

  @override
  Widget build(BuildContext context) {
    account = context.watch<AccountManager>().account;

    final loading = context.watch<AccountManager>().loading;
    final _contollerBalance = TextEditingController();
    final primaryColor = Theme.of(context).primaryColor;
    final accentColor = Theme.of(context).accentColor;

    _onClickDeposit() async {
      if (_contollerBalance.text.isNotEmpty ||
          _opcionSeleccionada2.isNotEmpty ||
          _opcionSeleccionada.isNotEmpty) {
        int currentAccount = account.id;
        final realValue = _opcionSeleccionada2.replaceAll(" KZ", "");
        ApiResponse apiResponse = await context.read<AccountManager>().raise(
              currentAccount: currentAccount,
              balance: num.tryParse(realValue),
            );
        if (apiResponse.ok) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text("Plano carregado com sucesso"),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.grey),
          );
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
              hint: Text("Selecione o valor"),
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
