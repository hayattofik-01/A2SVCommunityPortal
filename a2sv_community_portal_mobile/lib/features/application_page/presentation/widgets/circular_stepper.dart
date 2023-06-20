import 'dart:math';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularStepper extends StatelessWidget {
  final String text;
  final double percentage;

  const CircularStepper({
    Key? key,
    required this.text,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return CircularPercentIndicator(
      radius: max((41.5 / 1002) * screenHeight, (41.5 / 428) * screenWidth),
      lineWidth: max((8.5 / 1002) * screenHeight, (8.5 / 428) * screenWidth),
      animation: true,
      backgroundColor: Colors.white,
      percent: percentage,
      center: Text(
        text,
        style: TextStyle(
          fontSize: max((16 / 1002) * screenHeight, (16 / 428) * screenWidth),
        ),
      ),
      progressColor: Color(0xFF3182CE),
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
