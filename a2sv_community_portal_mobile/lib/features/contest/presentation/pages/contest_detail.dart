import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/presentation/widgets/countdown_timer_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContestDetails extends StatelessWidget {
  final Contest contest;
  const ContestDetails({super.key, required this.contest});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: whiteColor,
            leading: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            )),
        body: Container(
          padding: const EdgeInsets.all(13),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  contest.title,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 1)),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                SizedBox(
                  height: screenHeight * 0.12,
                  child: CountdownTimerWidget(
                    targetDateTime: contest.date,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Text(
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromRGBO(107, 114, 128, 1)),
                    contest.description),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: screenWidth * 0.45,
                    height: screenHeight * 0.06,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        launchUrl(Uri.parse(contest.link));
                      },
                      icon: const Icon(
                        Icons.open_in_browser_outlined,
                        color: Colors.white,
                        size: 24.0,
                      ),
                      label: const Text(
                        "Open Contest",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(49, 130, 206, 1),
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
