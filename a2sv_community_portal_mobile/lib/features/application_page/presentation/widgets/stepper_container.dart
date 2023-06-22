import 'dart:math';

import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/circular_stepper.dart';
import 'package:flutter/material.dart';

class StepperBox extends StatelessWidget {
  final String text;
  final double percentage;
  final String currentStep;
  final String nextStep;

  const StepperBox({
    Key? key,
    required this.text,
    required this.percentage,
    required this.currentStep,
    required this.nextStep,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: UIConverter.getComponentWidth(context, 18),
          right: UIConverter.getComponentWidth(context, 18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: CircularStepper(
              text: text,
              percentage: percentage,
            ),
          ),
          SizedBox(width: UIConverter.getComponentWidth(context, 56)),
          Expanded(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    currentStep,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w700,
                      fontSize: max(
                        UIConverter.getComponentHeight(context, 24),
                        UIConverter.getComponentWidth(context, 24),
                      ),
                      height: 1.21,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: UIConverter.getComponentHeight(context, 8)),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'Next: $nextStep',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: max(
                        UIConverter.getComponentHeight(context, 16),
                        UIConverter.getComponentWidth(context, 16),
                      ),
                      height: 1.5, // equivalent to line-height: 24px
                      color: const Color.fromRGBO(
                          0, 0, 0, 0.326), // equivalent to blackAlpha/300
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
