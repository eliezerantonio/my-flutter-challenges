import 'package:flutter/material.dart';

class CustomTextForm2 extends StatelessWidget {
  const CustomTextForm2({
    this.controller,
    this.icon,
    this.obscure = false,
    this.black = false,
    this.showPrefix = false,
    this.initialValue = "",
  });
  final TextEditingController controller;
  final IconData icon;
  final bool obscure;
  final bool black;
  final bool showPrefix;
  final String initialValue;
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Container(
      width: 340,
      alignment: Alignment.center,
      height: 50,
      child: TextFormField(
        initialValue: initialValue,
        keyboardType: TextInputType.number,
        obscureText: obscure,
        controller: controller,
        style: TextStyle(
            color: !black ? primaryColor : Colors.black, fontSize: 18),
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              icon,
              color: primaryColor,
            ),
            prefixText: showPrefix ? "0000.0000." : "",
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 15),
            errorMaxLines: 1,
            labelStyle: TextStyle(color: primaryColor),
            hintStyle: TextStyle(color: primaryColor)),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
    );
  }
}
