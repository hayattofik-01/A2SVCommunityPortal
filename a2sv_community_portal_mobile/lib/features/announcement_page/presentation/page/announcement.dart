import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/domain/entities/announcement.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/presentation/page/detail.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/widgets/tile.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/widgets/uppe_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/announcement_bloc.dart';

class AnnouncementPage extends StatelessWidget {
  AnnouncementPage({super.key});
  // final List<Map<String, dynamic>> _announcements = [
  //   {
  //     "title": "Updates Available",
  //     "description": "Big Hackathon Coming up",
  //     "isnew": false,
  //   },
  //   {
  //     "title": "Updates Available",
  //     "description": "Big Hackathon Coming up",
  //     "isnew": false,
  //   },
  // ];
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
          BlocBuilder<AnnouncementBloc, AnnouncementState>(
            builder: (context, state) {
              if (state is AnnouncementLoading) {
                return Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 50,
                  child: const CircularProgressIndicator(),
                );
              } else if (state is AnnouncementLoaded) {
                return Column(
                  children: <Widget>[
                    for (var data in state.announcements)
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                    title: data.title,
                                    description: data.description))),
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            padding:
                                const EdgeInsets.only(left: 16.0, right: 16.0),
                            child: CustomListTile(
                              header: data.title,
                              description: data.description,
                              isnew: false,
                            )),
                      )
                  ],
                );
              } else if (state is AnnouncementError) {
                return Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: const Center(
                    child: Text(
                      "No Recent Announcements",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: greyTextColor),
                    ),
                  ),
                );
              } else {
                return Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: const Center(
                    child: Text(
                      "No Recent Announcements",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: greyTextColor),
                    ),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
