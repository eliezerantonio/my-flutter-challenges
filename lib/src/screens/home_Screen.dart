import 'package:bfa_turismo/src/componets/liquid_pages.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class HomeScreen extends StatelessWidget {
  final controller = LiquidController();
  @override
  Widget build(BuildContext context) {
    pageChangeCallback(int page) {
      print(page);
    }

    updateTypeCallback(UpdateType updateType) {
      print(updateType);
    }

    return Scaffold(
      body: LiquidSwipe(
        pages: liquidPages,
        liquidController: controller,
        fullTransitionValue: 800,
        enableLoop: true,
        positionSlideIcon: 0.8,
        waveType: WaveType.liquidReveal, //tipos
      ),
    );
  }
}
