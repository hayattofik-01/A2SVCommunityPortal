import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:a2sv_community_portal_mobile/core/utils/widgets/bottom_bar.dart';
import 'package:a2sv_community_portal_mobile/core/utils/widgets/upper_bar.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/custom_button.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/custom_card.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/stepper_container.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UpperBar(),
      backgroundColor: whiteColor,
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
                  children: const [
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
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
            child: SizedBox(
              height: UIConverter.getComponentHeight(context, 48),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      label: 'Previous',
                      onTap: () {},
                    ),
                    SizedBox(
                        width: UIConverter.getComponentWidth(context, 100)),
                    CustomButton(label: 'Next', onTap: () {})
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
}
