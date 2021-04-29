import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key key,
    @required this.onPressed,
    @required this.text,
  }) : super(key: key);

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Container(
      height: 47,
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        textColor: Colors.white,
        color: primaryColor,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
