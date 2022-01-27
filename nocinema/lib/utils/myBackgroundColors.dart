import 'package:flutter/material.dart';

final List<Color> backgroundDarkMode = [
  Colors.grey[850]!.withOpacity(0.2),
  Colors.grey[850]!.withOpacity(0.2),
  Colors.grey[850]!.withOpacity(0.2),
  Colors.grey[850]!.withOpacity(0.2),
  Colors.grey[850]!,
  Colors.grey[850]!,
  Colors.grey[850]!
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

final darkCustomColor = 0xff00838f;

MaterialColor getColor(double percent) {
  if (percent > 66) {
    return Colors.green;
  } else if (percent < 50) {
    return Colors.red;
  } else {
    return Colors.yellow;
  }
}
