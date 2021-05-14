import 'package:beats_ui/src/models/product_model.dart';
import 'package:beats_ui/src/widgets/buy_button.dart';
import 'package:beats_ui/src/widgets/circular_background.dart';
import 'package:beats_ui/src/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key key, this.productoModel}) : super(key: key);
  final ProductoModel productoModel;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int qtd = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CircularBackground(),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(),
                  SizedBox(
                    height: 20,
                  ),
                  Background(size: size, productoModel: widget.productoModel),
                ],
              ),
            ),
          ),
          Description(productoModel: widget.productoModel),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 30, bottom: 100),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                height: 130,
                width: 45,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: Color(widget.productoModel.color),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: Alignment.center,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              qtd++;
                            });
                          },
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "$qtd",
                      style: TextStyle(fontSize: 20),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          qtd--;
                        });
                      },
                      child: Icon(
                        Icons.remove,
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 10,
              left: 10,
              child: SizedBox(
                width: 500,
                height: 180,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    PrincipalCard(widget: widget),
                    SizedBox(
                      width: 20,
                    ),
                    SecondCard(
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SecondCard2(
                      color: Colors.red,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    SecondCard2(
                      color: Colors.blue,
                    ),
                  ],
                ),
              )),
          BuyButton(
            title: "Pay now",
            color: null,
            color2: widget.productoModel.color,
          )
        ],
      ),
    );
  }
}

class SecondCard extends StatelessWidget {
  const SecondCard({Key key, this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 180,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "*** 4324",
            ),
          ),
          Positioned(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "*** 4324",
                  ),
                  Row(
                    children: [
                      Text(
                        "Debit",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Visa",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}class SecondCard2 extends StatelessWidget {
  const SecondCard2({Key key, this.color}) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 8,
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 180,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "*** 4324",
            ),
          ),
          Positioned(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "*** 4324",
                  ),
                  Row(
                    children: [
                      Text(
                        "Debit",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Visa",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
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

class PrincipalCard extends StatelessWidget {
  const PrincipalCard({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final SecondScreen widget;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        children: [
          Container(
            width: 100,
            height: 180,
            decoration: BoxDecoration(
              color: Color(widget.productoModel.color),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "*** 4324",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Positioned(
            bottom: 10,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    "*** 4324",
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    children: [
                      Text(
                        "Debit",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Visa",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
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

class Description extends StatelessWidget {
  const Description({
    Key key,
    @required this.productoModel,
  }) : super(key: key);

  final ProductoModel productoModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 110, left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Beats",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            "Warriors ${productoModel.subtitulo}",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 18,
          ),
          Hero(
            tag: productoModel.id,
            child: Image.asset(
              "assets/${productoModel.url}",
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}

class Background extends StatelessWidget {
  const Background({
    Key key,
    @required this.size,
    @required this.productoModel,
  }) : super(key: key);

  final Size size;
  final ProductoModel productoModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.55,
      decoration: BoxDecoration(
        color: Color(productoModel.color),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(40),
        ),
      ),
    );
  }
}
