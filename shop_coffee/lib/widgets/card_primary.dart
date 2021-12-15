import 'package:coffee/models/Coffee.dart';
import 'package:coffee/screens/detail_coffe_screen.dart';
import 'package:coffee/widgets/icon_favorite.dart';
import 'package:flutter/material.dart';

class CardPrimary extends StatelessWidget {
  CardPrimary(this.coffee);
  Coffee coffee;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailCoffeeScreen(coffee),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 250,
            width: 400,
            child: Card(
              margin: EdgeInsets.all(22),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              elevation: 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 1,
                    ),
                    IconFavorite(
                      opacity: !coffee.isFavorite ? 0.4 : 1,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "\$${coffee.price}",
                      style:
                          TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${coffee.name}",
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 25, top: 7),
                      child: Text(
                        "${coffee.description}",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: 400,
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: [
                  Container(
                    //TODO:Meter Sombra
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Hero(
                        tag: coffee.id,
                        child: Image.asset(
                          "${coffee.imageUrl}",
                          width: 140,
                          height: 140,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      right: 10,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        child: Icon(
                          Icons.add_box_rounded,
                          size: 60,
                          color: Color.fromRGBO(
                            154,
                            73,
                            0,
                            1,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
