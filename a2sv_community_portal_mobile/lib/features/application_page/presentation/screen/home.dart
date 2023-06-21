import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/custom_button.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/custom_card.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/stepper_container.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/upper_bar.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: UpperBar(),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 17, bottom: 17.0),
            child: StepperBox(
              text: '1 of 4',
              percentage: 0.20,
              currentStep: 'stepName',
              nextStep: 'nextStepName',
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  CustomCard(
                    title: 'subStepName',
                    description:
                        'Lorem ipsum dolor sit alflkafl alflakfkl aflflka aflfkasf kaflka amet consectetur. ',
                    done: false,
                  ),
                  CustomCard(
                    title: 'subStepName',
                    description:
                        'Lorem ipsum dolor sit alflkafl alflakfkl aflflka aflfkasf kaflka amet consectetur. ',
                    done: true,
                  ),
                  CustomCard(
                    title: 'subStepName',
                    description:
                        'Lorem ipsum dolor sit alflkafl alflakfkl aflflka aflfkasf kaflka amet consectetur. ',
                    done: true,
                  ),
                  CustomCard(
                    title: 'subStepName',
                    description:
                        'Lorem ipsum dolor sit alflkafl alflakfkl aflflka aflfkasf kaflka amet consectetur. ',
                    done: true,
                  ),
                  CustomCard(
                    title: 'subStepName',
                    description:
                        'Lorem ipsum dolor sit alflkafl alflakfkl aflflka aflfkasf kaflka amet consectetur. ',
                    done: true,
                  ),
                  CustomCard(
                    title: 'subStepName',
                    description:
                        'Lorem ipsum dolor sit alflkafl alflakfkl aflflka aflfkasf kaflka amet consectetur. ',
                    done: true,
                  ),
                ],
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: Container(
              height: (48 / 1002) * screenHeight,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      label: 'Previous',
                      onTap: () {},
                    ),
                    SizedBox(width: (100 / 428) * screenWidth),
                    CustomButton(label: 'Next', onTap: () {})
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
