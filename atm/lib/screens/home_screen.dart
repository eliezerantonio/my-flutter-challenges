import 'package:atm/widgets/stain_widget.dart';
import 'package:atm/widgets/total_card_money.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CardTotalMoney(),
            SizedBox(height: 20),
            Expanded(
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: [
                  StainWidget(),
                  StainWidget(),
                  StainWidget(),
                  StainWidget(),
                  StainWidget(),
                  StainWidget(),
                  StainWidget(),
                  StainWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
