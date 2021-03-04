import 'package:bfa_turismo/src/screens/first_screen.dart';
import 'package:bfa_turismo/src/screens/places_screen.dart';
import 'package:bfa_turismo/src/screens/second_screen.dart';
import 'package:bfa_turismo/src/screens/third_screen.dart';
import 'package:flutter/material.dart';

final estiloTexto = TextStyle(fontSize: 20.0, color: Colors.white);

final liquidPages = [
  FirstScreen(),
  SecondScreen(),
  ThirdScreen(),
  PlacesScreen()
];
