import 'package:a2sv_community_portal_mobile/features/contest/presentation/widgets/previous_contests.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/widgets/upcoming_contests.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../../../core/utils/colors.dart';
import '../widgets/upper_bar.dart';
import 'package:http/http.dart' as http;

class ContestPage extends StatelessWidget {
  final http.Client httpClient = http.Client();
  final InternetConnectionChecker internetConnectionChecker =
      InternetConnectionChecker();

  ContestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: ListView(
        children: [
          const UpperBar(),
          const SizedBox(height: 26),
          Container(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: const Text('Upcoming Contests',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: blackText))),
          const SizedBox(height: 26),
          UpcommingContests(),
          Container(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16, bottom: 16),
              child: const Text('Recent Contests',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: blackText))),
          const PreviousContests(),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
