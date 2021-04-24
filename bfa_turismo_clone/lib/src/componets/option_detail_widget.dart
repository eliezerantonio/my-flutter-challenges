import 'package:flutter/material.dart';

class OptionDetailWidget extends StatefulWidget {
  OptionDetailWidget(
      {Key key, this.function, this.icon, this.selected, this.text})
      : super(key: key);

  final Function function;
  final IconData icon;
  bool selected;
  final String text;
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
        width: 170,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: 50,
                  color: widget.selected ? Colors.orange[800] : Colors.grey,
                ),
                Text(widget.text),
              ],
            ),
            Container(
              height: 3,
              width: 170,
              color: widget.selected ? Colors.orange[800] : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
