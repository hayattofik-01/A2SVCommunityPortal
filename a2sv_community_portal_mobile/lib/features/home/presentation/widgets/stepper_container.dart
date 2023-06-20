import 'package:a2sv_community_portal_mobile/features/home/presentation/widgets/circular_stepper.dart';
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
        padding: EdgeInsets.only(left: (18 / 450) * screenWidth),
        child: Row(
          children: [
            SizedBox(height: 4),
            Align(
              alignment: Alignment.topLeft,
              child: CircularStepper(
                text: text,
                percentage: percentage,
              ),
            ),
            SizedBox(width: (56 / 428) * screenWidth),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: (15 / 428) * screenWidth),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currentStep,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w700,
                        fontSize: (24.0 / 428) * screenWidth,
                      ),
                    ),
                    SizedBox(height: (8 / 428) * screenWidth),
                    Text(
                      'Next: $nextStep',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: (16.0 / 428) * screenWidth,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}