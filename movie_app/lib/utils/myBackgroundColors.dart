import 'package:flutter/material.dart';

final List<Color> backgroundDarkMode = [
  Colors.black.withOpacity(0.4),
  Colors.black.withOpacity(0.4),
  Colors.black.withOpacity(0.4),
  Colors.black.withOpacity(0.4),
  Colors.black,
  Colors.black,
  Colors.black,
];
final List<Color> backgroundWhiteMode = [
  Colors.grey.shade50.withOpacity(0.0),
  Colors.grey.shade50.withOpacity(0.0),
  Colors.grey.shade50.withOpacity(0.0),
  Colors.grey.shade50.withOpacity(0.0),
  Colors.grey.shade50.withOpacity(1),
  Colors.grey.shade50.withOpacity(1),
  Colors.grey.shade50.withOpacity(1),
  Colors.grey.shade50.withOpacity(1),
];

MaterialColor getColor(double percent) {
  if (percent > 66) {
    return Colors.green;
  } else if (percent < 50) {
    return Colors.red;
  } else {
    return Colors.yellow;
  }
}
