import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardsView extends StatelessWidget {
  const CardsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 370,
      child: PageView(
        controller: PageController(viewportFraction: 0.9),
        children: [
          _Card(),
          _Card(),
          _Card(),
          _Card(),
          _Card(),
          _Card(),
        ],
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Row(
            children: [
              _PrimaryDescription(),
              SizedBox(width: 55),
              _TarjetaDescription(),
            ],
          ),
          Positioned(
            top: 65,
            left: 50,
            child: Image(
              image: AssetImage("assets/blue.png"),
              width: 160,
            ),
          )
        ],
      ),
    );
  }
}

class _PrimaryDescription extends StatelessWidget {
  const _PrimaryDescription({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: RotatedBox(
        quarterTurns: 3,
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.batteryFull,
              size: 15,
            ),
            SizedBox(width: 10),
            Text(
              "40-Hour Battery",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(width: 30),
            Icon(
              FontAwesomeIcons.wifi,
              size: 15,
            ),
            SizedBox(width: 10),
            Text(
              "Wireless",
              style: TextStyle(fontSize: 12),
            ),
            SizedBox(width: 30),
          ],
        ),
      ),
    );
  }
}

class _TarjetaDescription extends StatelessWidget {
  const _TarjetaDescription({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: size.width * 0.55,
          color: Color(0xff0B3fa2),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Warriors',
                        style: TextStyle(color: Colors.white24, fontSize: 30)),
                    Text('Royal Blue',
                        style: TextStyle(color: Colors.white24, fontSize: 30)),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Text(
                      "Beats Studio Wireless",
                      style: TextStyle(color: Colors.white),
                    ),
                    Spacer(),
                    Icon(FontAwesomeIcons.heart, color: Colors.white),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Text(
                      '\$349.55',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    width: 80,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        "Add to bag",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    width: 120,
                    height: 45,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(30))),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
