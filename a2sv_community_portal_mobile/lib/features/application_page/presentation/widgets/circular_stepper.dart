import 'dart:math';
import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
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
    return CircularPercentIndicator(
      radius: max(
        UIConverter.getComponentWidth(context, 45),
        UIConverter.getComponentHeight(context, 45),
      ),
      lineWidth: max(
        UIConverter.getComponentHeight(context, 8.5),
        UIConverter.getComponentWidth(context, 8.5),
      ),
      animation: true,
      backgroundColor: Colors.white,
      percent: percentage,
      center: Text(
        text,
        style: TextStyle(
          fontSize: max(
            UIConverter.getComponentHeight(context, 16),
            UIConverter.getComponentWidth(context, 16),
          ),
        ),
      ),
      progressColor: primary,
      circularStrokeCap: CircularStrokeCap.round,
    );
  }
}
