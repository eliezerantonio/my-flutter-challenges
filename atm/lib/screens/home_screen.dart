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
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 40,
              child: LogoWidget(),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
            )
          ],
        ),
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                    "https://media-exp1.licdn.com/dms/image/C4E03AQH3z80PWFUCww/profile-displayphoto-shrink_800_800/0/1609831784971?e=1625097600&v=beta&t=T2UQrb8ai6-9ztk8x7GGGmOrmuLaaochzdN8kX7w4SQ"),
              ),
            ),
          ),
        ],
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
                    subtitle: "Consultar dados",
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
