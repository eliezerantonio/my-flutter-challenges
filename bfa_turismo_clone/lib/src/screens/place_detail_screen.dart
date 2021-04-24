import 'dart:ui';

import 'package:bfa_turismo/src/componets/expansion_tile_custom.dart';
import 'package:bfa_turismo/src/componets/expansion_tile_custom2.dart';
import 'package:bfa_turismo/src/componets/option_detail_widget.dart';
import 'package:bfa_turismo/src/componets/point_custom.dart';
import 'package:bfa_turismo/src/componets/text_timber_widget.dart';
import 'package:bfa_turismo/src/componets/text_top_widget.dart';
import 'package:bfa_turismo/src/componets/triangle_custom.dart';
import 'package:bfa_turismo/src/models/place.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class PlaceDetailScreen extends StatefulWidget {
  PlaceDetailScreen({Key key, @required this.place});
  var place = Place();

  @override
  _PlaceDetailScreenState createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          "images/logo.png",
          width: 100,
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            padding: EdgeInsets.all(1),
            child: Column(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Image.asset(
                          widget.place.imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      TriangleCustom(
                        edge: Edge.LEFT,
                        height: 300,
                        opacity: 0.3,
                        width: 1800,
                        alignmentGeometry: Alignment.topLeft,
                        colorNum: 100,
                      ),
                      PointCustom(
                        alignmentGeometry: Alignment.centerLeft,
                        height: 180,
                        numSize: 100,
                        width: 190,
                        opacity: 1.0,
                        edge: Edge.RIGHT,
                      ),
                      TriangleCustom(
                        edge: Edge.RIGHT,
                        height: 100,
                        opacity: 0.6,
                        width: 150,
                        alignmentGeometry: Alignment.centerLeft,
                        colorNum: 300,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextTopWidget(
                                color: Colors.grey[500],
                                fontSize: 14,
                                text: "BFA Turismo",
                              ),
                              Container(
                                width: 190,
                                child: TextTopWidget(
                                  color: Colors.orange[800],
                                  fontSize: 24,
                                  text: widget.place.title.toUpperCase(),
                                ),
                              ),
                              // SizedBox()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 35,
                  width: double.infinity,
                  color: Colors.orange[800],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextTimberWidget(
                        place: widget.place.capital,
                        title: 'Capital',
                      ),
                      TextTimberWidget(
                        place: widget.place.climate,
                        title: ' | Clima',
                      ),
                      TextTimberWidget(
                        place: widget.place.temperature,
                        title: ' | Temperatura',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 10, top: 7, right: 10, bottom: 10),
            child: Text("${widget.place.description}",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.justify),
          ),
          Row(
            children: [
              Expanded(
                child: OptionDetailWidget(
                  text: "Pontos Turisticos",
                  function: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  icon: Octicons.info,
                  selected: !selected,
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Expanded(
                child: OptionDetailWidget(
                  text: "Agências",
                  function: () {
                    setState(
                      () {
                        selected = !selected;
                      },
                    );
                  },
                  selected: selected,
                  icon: FontAwesome.home,
                ),
              ),
            ],
          ),
          !selected
              ? AnimationLimiter(
                  child: AnimationConfiguration.staggeredList(
                    position: 0,
                    duration: const Duration(milliseconds: 1300),
                    child: SlideAnimation(
                      horizontalOffset: 100.0,
                      child: FadeInAnimation(
                        child: Column(
                          children: [
                            ExpansionTileCustom(
                              title: Text(
                                "Imperdível".toUpperCase(),
                              ),
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  height:
                                      40.0 * widget.place.points.length + 40,
                                  child: ListView.builder(
                                    itemCount: widget.place.points.length,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ExpansionTileCustom2(
                                        title:
                                            Text(widget.place.points[index][0]),
                                        children: [
                                          Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Icon(
                                                          Icons.location_on)),
                                                  Expanded(
                                                    flex: 3,
                                                    child: Text(
                                                      widget.place.points[index]
                                                          [(1)],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              Colors.grey[600]),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                )
                              ],
                            ),
                            /* ExpansionTileCustom(
                              title: Text(
                                "Inesquecível comida da região".toUpperCase(),
                              ),
                            ),
                            ExpansionTileCustom(
                              title: Text(
                                "Melhores caminhos".toUpperCase(),
                              ),
                            ),*/
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Column(
                  children: [
                    ExpansionTileCustom(
                      title: Text(
                        "agencias".toUpperCase(),
                      ),
                    ),
                    ExpansionTileCustom(
                      title: Text(
                        "agencias".toUpperCase(),
                      ),
                    ),
                  ],
                ),
        ],
      ),
    );
  }
}
