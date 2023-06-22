import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/widgets/tile.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/widgets/uppe_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnnouncementPage extends StatelessWidget {
  AnnouncementPage({super.key});
  final List<Map<String, dynamic>> _announcements = [
    {
      "title": "Updates Available",
      "description": "Big Hackathon Coming up",
      "isnew": false,
    },
    {
      "title": "Updates Available",
      "description": "Big Hackathon Coming up",
      "isnew": false,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: ListView(
        children: [
          const UpperBar(
            title: 'Announcemet',
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              for (var data in _announcements)
                GestureDetector(
                  child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: CustomListTile(
                        header: data["title"],
                        description: data["description"],
                        isnew: data["isnew"],
                      )),
                )
            ],
          )
        ],
      ),
    );
  }
}
