import 'package:flutter/material.dart';

class BackgroundBottomWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.10,
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius:
              BorderRadiusDirectional.only(topEnd: Radius.circular(50))),
    );
  }
}
