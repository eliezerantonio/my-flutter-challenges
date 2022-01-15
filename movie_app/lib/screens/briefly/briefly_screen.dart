import 'package:flutter/material.dart';
import 'package:nicolau/bloc_navigation/bloc_navigation.dart';

class BrieflyScreen extends StatelessWidget with NavigationStates {
  const BrieflyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      child:Center(child:Text("Populares"))
    );
  }
}
