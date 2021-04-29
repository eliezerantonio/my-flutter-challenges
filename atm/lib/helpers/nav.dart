import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {bool replace = false}) {
  if (replace) {
    return Navigator.pushReplacement(context, _crearRuta(page));
  }
  return Navigator.push(context, _crearRuta(page));
}

Route _crearRuta(Widget widget) {
  return PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) =>
        widget,
    transitionDuration: Duration(seconds: 1),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final curvedAnimation =
          CurvedAnimation(parent: animation, curve: Curves.ease);

      // return SlideTransition(
      //   position: Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset.zero ).animate(curvedAnimation),
      //   child: child,
      // );

      return ScaleTransition(
          child: child,
          scale: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));

      // //   RotationTransition
      // return RotationTransition(
      //   child: child,
      //   turns: Tween<double>(begin: 0.0, end: 1.0 ).animate(curvedAnimation)
      // );

      // return FadeTransition(
      //     child: child,
      //     opacity:
      //         Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation));

      //  return RotationTransition(
      //   child: FadeTransition(
      //       child: child,
      //       opacity:
      //           Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation)),
      //   turns: Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
      // );
    },
  );
}
