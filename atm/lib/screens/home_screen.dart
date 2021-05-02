import 'package:atm/helpers/nav.dart';
import 'package:atm/screens/raise_screen.dart';
import 'package:atm/user/user.dart';
import 'package:atm/user/user_manager.dart';
import 'package:atm/screens/send_money_screen.dart';
import 'package:atm/widgets/credit_card.dart';
import 'package:atm/widgets/logo_widget.dart';
import 'package:atm/widgets/stain_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'charge_account_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = context.watch<UserManager>().user;

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
                  "Olá, ${user.name}",
                  style: TextStyle(color: Colors.black, fontSize: 13),
                ),
                Text(
                  "Bem-Vindo",
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
                child: Image.network(user.pic),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: ListView(
            children: [
              MyCreditCard(),
              SizedBox(height: 7),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: SizedBox(
                  width: 150,
                  height: size.height - 120,
                  child: GridView(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    children: [
                      GestureDetector(
                        onTap: () {
                          push(context, SendMoneyScreen());
                        },
                        child: StainWidget(
                          icon: Icons.file_upload,
                          title: "Enviar",
                          subtitle: "Enviar dinheiro",
                          color: Colors.red[100],
                          colorIcon: Colors.red,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          push(context, ChargeAccountScreen());
                        },
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
                      StainWidget(
                        icon: Icons.attach_money_sharp,
                        title: "Pagamentos",
                        subtitle: "Contas",
                        color: Colors.amber[100],
                        colorIcon: Colors.amber,
                      ),
                      StainWidget(
                        icon: Icons.shopping_cart_outlined,
                        title: "Compras",
                        subtitle: "Compras online",
                        color: Colors.lightBlue[100],
                        colorIcon: Colors.lightBlue,
                      ),
                      GestureDetector(
                        onTap: () {
                          push(context, RaiseScreen());
                        },
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
      ),
    );
  }
}
