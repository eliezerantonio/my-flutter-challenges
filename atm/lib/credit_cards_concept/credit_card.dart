import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreditCard extends ChangeNotifier {
  final Color color;
  final String number;
  final String ccv;
  double amount;

  CreditCard({
    this.color,
    this.number,
    this.ccv,
    this.amount,
  });
}

double doubleInRange(Random source, int start, int end) =>
    source.nextDouble() * (end - start) + start;
