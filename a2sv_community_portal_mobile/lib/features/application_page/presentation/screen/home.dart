import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/custom_button.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/custom_card.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/stepper_container.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: (100 / 1002) * screenHeight,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w500,
                fontSize: (23 / 1002) * screenHeight,
                height: 17.0 / 14.0, // line height in Flutter
                letterSpacing: 0.02,
                color: Color(0xFFA8A8A8),
              ),
            ),
            Text(
              'Seid',
              style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w600,
                  fontSize: (40 / 1002) * screenHeight,
                  height: 1.2, // equivalent to line-height: 24px
                  letterSpacing: 0.02,
                  color: Color.fromARGB(255, 0, 0, 0)),
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: [
          Theme(
            data: ThemeData(
              iconTheme: IconThemeData(
                color: Colors.black, // set the color to black
                size: (40.0 / 1002) * screenHeight, // set the size to 40.0
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                // Handle notification icon press
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 17, bottom: 17.0),
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
            padding: const EdgeInsets.only(bottom: 15.0),
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
