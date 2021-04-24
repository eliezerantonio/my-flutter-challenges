import 'dart:io';
import 'dart:ui';

import 'package:coffee/data/coffee_data.dart';
import 'package:coffee/models/Coffee.dart';
import 'package:coffee/screens/detail_coffe_screen.dart';
import 'package:coffee/widgets/card_primary.dart';
import 'package:coffee/widgets/card_secundary.dart';
import 'package:coffee/widgets/logo_widget.dart';
import 'package:coffee/widgets/search_widget.dart';
import 'package:flutter/material.dart';

enum FilterOptions { Favorite, All }

class HomeScreen extends StatelessWidget {
  List<Coffee> coffees = DUMMY_COFFEES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchWidget(),
          Expanded(
            child: ListView(
              children: [
                Container(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: coffees.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CardPrimary(coffees[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Popular",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                CardSecunday(),
                CardSecunday(),
                CardSecunday(),
                CardSecunday(),
                CardSecunday(),
                CardSecunday(),
                CardSecunday(),
                CardSecunday(),
                CardSecunday()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
