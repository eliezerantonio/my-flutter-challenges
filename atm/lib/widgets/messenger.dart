import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void messenger(BuildContext context, String text, {bool error}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
        content: Text(text),
        duration: Duration(seconds: 2),
        backgroundColor: error ? Colors.red : Colors.grey),
  );
}
