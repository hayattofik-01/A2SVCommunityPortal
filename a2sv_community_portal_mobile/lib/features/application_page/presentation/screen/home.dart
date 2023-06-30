import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:a2sv_community_portal_mobile/core/utils/widgets/bottom_bar.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/upper_bar.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/bloc/application_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/custom_button.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/custom_card.dart';
import 'package:a2sv_community_portal_mobile/features/application_page/presentation/widgets/stepper_container.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final http.Client httpClient = http.Client();
  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:16),
      child: Scaffold(
        backgroundColor: whiteColor,
        appBar: const UpperBar(),
        body: BlocBuilder<ApplicationBloc, ApplicationState>(
            builder: (context, state) {
          if (state is ApplicationLoading) {
                      return Container(
              alignment: Alignment.center,
              width: 130,
              height: 130,
              child: const CircularProgressIndicator(),
            );
          } else if (state is ApplicationLoaded) {
            final subSteps = state.applicationStepEntity[i].subSteps;
            final subStepCards = subSteps.map((subStep) {
              return CustomCard(
                title: subStep.subStepName,
                description: subStep.description,
                done: subStep.isCompleted,
              );
            }).toList();
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 17, bottom: 17.0),
                  child: StepperBox(
                    text: '${i + 1} of ${state.applicationStepEntity.length}',
                    percentage: (i + 1) / (state.applicationStepEntity.length),
                    currentStep: state.applicationStepEntity[i].stepName,
                    nextStep: i != state.applicationStepEntity.length - 1
                        ? state.applicationStepEntity[i + 1].stepName
                        : "Apply",
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: subStepCards,
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          i != 0
                              ? CustomButton(
                                  label: 'Previous',
                                  onTap: () {
                                    if (i > 0) {
                                      setState(() {
                                        i -= 1;
                                      });
                                    }
                                  },
                                )
                              : SizedBox(
                                  width: UIConverter.getDeviceWidth(context) > 700
                                      ? 124
                                      : UIConverter.getComponentWidth(
                                          context, 124),
                                  height:
                                      UIConverter.getComponentHeight(context, 48),
                                ),
                          i != state.applicationStepEntity.length - 1
                              ? CustomButton(
                                  label:
                                      i != state.applicationStepEntity.length - 1
                                          ? 'Next'
                                          : 'Apply',
                                  onTap: () {
                                    if (i <
                                        state.applicationStepEntity.length - 1) {
                                      setState(() {
                                        i += 1;
                                      });
                                    }
                                  })
                              : SizedBox(
                                  width: UIConverter.getDeviceWidth(context) > 700
                                      ? 124
                                      : UIConverter.getComponentWidth(
                                          context, 124),
                                  height:
                                      UIConverter.getComponentHeight(context, 48),
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (state is ApplicationError) {
            return Text(state.message);
          } else {
            return Text("${state is ApplicationInitial}");
          }
        }),
      ),
    );
  }
}
