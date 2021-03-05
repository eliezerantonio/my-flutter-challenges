import 'package:bfa_turismo/src/componets/liquid_pages.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    pageChangeCallback(int page) {
      setState(() {
        currentPage = page;
      });

      print(currentPage);
    }

    updateTypeCallback(UpdateType updateType) {
      print(updateType);
    }

    return Scaffold(
      body: LiquidSwipe(
        pages: liquidPages,
        fullTransitionValue: currentPage != 2 ? 800 : 0,
        enableLoop: false,
        waveType: WaveType.liquidReveal, //tipos
        onPageChangeCallback: pageChangeCallback,
        currentUpdateTypeCallback: updateTypeCallback,
      ),
    );
  }
}
