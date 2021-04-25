import 'package:atm/widgets/logo_widget.dart';
import 'package:atm/widgets/stain_widget.dart';
import 'package:atm/widgets/total_card_money.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: LogoWidget(),
        leadingWidth: 30,
        
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Hello, Eliezer Antonio",
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
            Text(
              "Bem- Vindo",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CardTotalMoney(),
            SizedBox(height: 20),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  StainWidget(
                    icon: Icons.file_upload,
                    title: "Enviar",
                    subtitle: "Enviar dinheiro",
                    color: Colors.red[100],
                    colorIcon: Colors.red,
                  ),
                  StainWidget(
                    icon: Icons.file_download,
                    title: "Receber",
                    subtitle: "Receber dinheiro",
                    color: Colors.green[100],
                    colorIcon: Colors.green,
                  ),
                  StainWidget(
                    icon: Icons.search,
                    title: "Consultar",
                    subtitle: "Receber dinheiro",
                    color: Colors.indigo[100],
                    colorIcon: Colors.indigo,
                  ),
                  StainWidget(
                    icon: Icons.attach_money_sharp,
                    title: "Pagamentos",
                    subtitle: "Contas",
                    color: Colors.amber[100],
                    colorIcon: Colors.amber,
                  ),
                  StainWidget(
                    icon: Icons.download_done_outlined,
                    title: "Receber",
                    subtitle: "Receber dinheiro",
                    color: Colors.green[100],
                    colorIcon: Colors.green,
                  ),
                  StainWidget(
                    icon: Icons.download_done_outlined,
                    title: "Receber",
                    subtitle: "Receber dinheiro",
                    color: Colors.green[100],
                    colorIcon: Colors.green,
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
