import 'package:bfa_turismo/src/screens/first_screen.dart';
import 'package:flutter/material.dart';

final estiloTexto = TextStyle(fontSize: 20.0, color: Colors.white);

final liquidPages = [
  FirstScreen(),
  Container(
    color: Colors.deepPurple,
    child: Center(
      child: Text(
        "Slide 2",
        style: estiloTexto,
      ),
    ),
  ),
  Container(
    color: Colors.redAccent,
    child: Center(
      child: Text(
        "Slide 3",
        style: estiloTexto,
      ),
    ),
  ),
  Container(
    color: Colors.blue,
    child: Center(
      child: Text(
        "Slide 4",
        style: estiloTexto,
      ),
    ),
  ),
  Container(
    color: Colors.green,
    child: Center(
      child: Text(
        "Slide 5",
        style: estiloTexto,
      ),
    ),
  )
];
