 import 'package:flutter/material.dart';
import 'package:nicolau/utils/responsive.dart';

Container dateReleaseWidget(Responsive responsive, String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: responsive.wp(4),
          color: Colors.grey[850],
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(30)),
    );
  }