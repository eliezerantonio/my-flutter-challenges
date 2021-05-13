import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardsView extends StatelessWidget {
  const CardsView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      child: _Card(),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [_PrimaryDescription(), SizedBox(), _TarjetaDescription()],
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
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),

        
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
