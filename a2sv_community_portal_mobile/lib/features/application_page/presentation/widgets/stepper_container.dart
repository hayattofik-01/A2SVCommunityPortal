import 'dart:math';

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
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            left: (18 / 450) * screenWidth, right: (18 / 450) * screenWidth),
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
            SizedBox(width: (56 / 428) * screenWidth),
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
                        fontSize: max((24 / 1002) * screenHeight,
                            (24 / 428) * screenWidth),
                        height: 1.21,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: (8 / 428) * screenWidth),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'Next: $nextStep',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: max((16 / 1002) * screenHeight,
                            (16 / 428) * screenWidth),
                        height: 1.5, // equivalent to line-height: 24px
                        color: Color.fromRGBO(
                            0, 0, 0, 0.326), // equivalent to blackAlpha/300
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
