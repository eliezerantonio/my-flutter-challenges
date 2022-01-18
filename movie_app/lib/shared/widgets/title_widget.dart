import 'package:flutter/material.dart';
import 'package:nicolau/utils/responsive.dart';

Padding titleWidget(Responsive responsive, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        title,
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: responsive.dp(2.5),
          color: Colors.grey[850],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }