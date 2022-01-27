import 'package:flutter/material.dart';
import 'package:nocinema/models/movie_model.dart';
import 'package:nocinema/utils/myBackgroundColors.dart';
import 'package:nocinema/utils/responsive.dart';

import 'package:percent_indicator/percent_indicator.dart';

Container percentWidget(
    {required Responsive responsive,
    required double percent,
    required Movie movie}) {
  return Container(
    width: responsive.dp(6),
    height: responsive.dp(6),
    decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(responsive.hp(10))),
    child: CircularPercentIndicator(
      radius: responsive.dp(5),
      animation: true,
      lineWidth: 4.0,
      animateFromLastPercent: true,
      animationDuration: 2000,
      percent: (movie.voteAverage * 0.1),
      center: Text(
        "${percent.toStringAsFixed(0)}%",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: responsive.dp(1.5)),
      ),
      progressColor: getColor(percent),
    ),
  );
}
