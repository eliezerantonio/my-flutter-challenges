import 'package:flutter/material.dart';

class OptionDetailWidget extends StatefulWidget {
  OptionDetailWidget({Key key, this.function, this.icon, this.selected})
      : super(key: key);

  final Function function;
  final IconData icon;
  bool selected;
  @override
  _OptionDetailWidgetState createState() => _OptionDetailWidgetState();
}

class _OptionDetailWidgetState extends State<OptionDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.function();
        setState(() {
          widget.selected = !widget.selected;
        });
      },
      child: Container(
        color: widget.selected ? Colors.grey[200] : Colors.transparent,
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 60,
                  color: widget.selected ? Colors.orange[800] : Colors.grey,
                ),
                Text("Pontos Turisticos"),
              ],
            ),
            Container(
              height: 3,
              width: 190,
              color: widget.selected ? Colors.orange[800] : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
