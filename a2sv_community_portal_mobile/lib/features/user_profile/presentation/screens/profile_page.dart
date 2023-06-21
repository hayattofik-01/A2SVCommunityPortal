import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/bio_card.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/developers_handel_card.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/education_card.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/socials_card.dart';
import 'package:flutter/material.dart';

import '../widgets/title_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const TitleBar(
            title: "Profile",
            iconName: "edit_icon",
          ),
          Expanded(
            child: ListView(
              children: const [
                BioCard(),
                EducationCard(),
                DeveloperHandelCard(),
                SocialCard(),
              ],
            ),
          ),
          BottomNavigationBar(items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "simon"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "chala")
          ])
        ],
      ),
    ));
  }
}
