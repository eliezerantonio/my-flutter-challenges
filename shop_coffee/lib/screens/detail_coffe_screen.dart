import 'dart:ui';

import 'package:coffee/models/Coffee.dart';
import 'package:coffee/widgets/background_bottom_widget.dart';
import 'package:coffee/widgets/background_top_widget.dart';
import 'package:coffee/widgets/icon_favorite.dart';
import 'package:flutter/material.dart';

class DetailCoffeeScreen extends StatelessWidget {
  DetailCoffeeScreen(this.coffee);
  Coffee coffee;
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                BackgroundTopWidget(),
                Align(
                  alignment: Alignment.topRight,
                  child: Hero(
                    tag: coffee.id,
                    child: Image.asset(
                      coffee.imageUrl,
                      width: 250,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: IconFavorite(
                      opacity: !coffee.isFavorite ? 0.3 : 1,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 170,
                    height: 50,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            color: Color.fromRGBO(154, 73, 0, 1),
                            icon: Icon(
                              Icons.remove,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                                fontSize: 30,
                                color: Color.fromRGBO(154, 73, 0, 1)),
                          ),
                          IconButton(
                            color: Color.fromRGBO(154, 73, 0, 1),
                            icon: Icon(
                              Icons.add,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Text(
                    coffee.name,
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 15),
                  Text(
                    coffee.description,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: BackgroundBottomWidget(),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Text("\$${coffee.price.toString()}",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      SizedBox(
                        width: 40,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 45,
                          child: RaisedButton(
                            child: Text("Adicionar ao Carrinho"),
                            onPressed: () {},
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
