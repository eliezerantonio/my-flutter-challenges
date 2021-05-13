import 'package:beats_ui/src/widgets/buy_button.dart';
import 'package:beats_ui/src/widgets/cards_view.dart';
import 'package:beats_ui/src/widgets/circular_background.dart';
import 'package:beats_ui/src/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CircularBackground(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  _Header(),
                  CardsView()
                ],
              ),
            ),
          ),
          BuyButton()
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 45,
          ),
          Text(
            "Beats",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            "By Dre",
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
