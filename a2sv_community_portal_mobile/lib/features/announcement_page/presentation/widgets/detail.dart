import 'package:a2sv_community_portal_mobile/features/notifications/presentation/widgets/uppe_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AnnouncementDetailsPage extends StatelessWidget {
  const AnnouncementDetailsPage(
      {super.key, required this.title, required this.description});
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const UpperBar(
            title: '',
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Text(
              title ?? "No Announcement",
              style: const TextStyle(
                fontFamily: "Popins",
                height: 1.5,
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Html(
              data: description ?? "No Announcement",
              // description ?? "No Announcement",
              // style: const TextStyle(
              //   color: Color(0xFF000000),
              //   fontFamily: 'Inter',
              //   height: 1.5,
              //   fontSize: 16,
              //   fontWeight: FontWeight.w500,
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
