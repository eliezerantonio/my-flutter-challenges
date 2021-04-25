import 'package:flutter/material.dart';

class StainWidget extends StatelessWidget {
  const StainWidget(
      {Key key,
      @required this.title,
      @required this.subtitle,
      @required this.icon})
      : super(key: key);
  final String title;
  final String subtitle;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 157,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[200],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: 30,
                    height: 30,
                    child: Icon(
                      icon,
                      color: Colors.red,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red[100],
                    ),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
