import 'package:flutter/material.dart';
import 'dart:math' as math;

class Responsive {
  late double _width;
  late double _height;
  late double _digonal;

  static Responsive of(BuildContext context) => Responsive(context);

  Responsive(BuildContext context) {
    final size = MediaQuery.of(context).size;
    _width = size.width;
    _height = size.height;

    //c2+a2+b2=>c=srt(a2+b2)

    _digonal = math.sqrt(math.pow(_width, 2) + math.pow(_height, 2));
  }

  double wp(double percent) => _width * percent / 100;
  double hp(double percent) => _height * percent / 100;
  double dp(double percent) => _digonal * percent / 100;

  double get width => _width;
  double get height => _height;
  double get digonal => _digonal;
}
