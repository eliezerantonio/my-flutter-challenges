import 'package:bfa_turismo/src/screens/first_screen.dart';
import 'package:bfa_turismo/src/screens/second_screen.dart';
import 'package:bfa_turismo/src/screens/third_screen.dart';
import 'package:flutter/material.dart';

final estiloTexto = TextStyle(fontSize: 20.0, color: Colors.white);

final liquidPages = [
  FirstScreen(),
  SecondScreen(),
  ThirdScreen(),
  Container(
    color: Colors.blue,
    child: Center(
      child: Text(
        "Slide 4",
        style: estiloTexto,
      ),
    ),
  ),
];
