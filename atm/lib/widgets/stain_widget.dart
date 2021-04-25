import 'package:flutter/material.dart';

class StainWidget extends StatelessWidget {
  const StainWidget({
    Key key,
    @required this.title,
    @required this.subtitle,
    @required this.icon,
    @required this.color,
    @required this.colorIcon,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 150,
          height: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[100],
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
                    color: colorIcon,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color,
                  ),
                ),
                SizedBox(
                  height: 17,
                ),
                Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(
                  height: 20,
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
    );
  }
}
