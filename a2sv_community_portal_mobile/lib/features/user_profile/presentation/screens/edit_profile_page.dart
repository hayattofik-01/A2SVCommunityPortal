import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/edit_card.dart';
import 'package:flutter/material.dart';
import '../widgets/title_bar.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          const TitleBar(
            title: "Edit Profile",
            iconName: "save_icon",
          ),
          Expanded(
            child: ListView(children: const [
              EditCard(
                boxHeight: 511,
                title: "Socials",
                fieldList: [
                  ['Full Name', 'profile_icon'],
                  ['Country', 'flag_icon'],
                  ['Phone Number', 'phone_icon'],
                  ['Email', 'email_icon'],
                ],
              ),
              EditCard(
                boxHeight: 300,
                fieldList: [
                  ['University', 'school_icon'],
                  ['Graduation Year', 'school_icon'],
                  ['Major', 'cap_icon'],
                ],
                title: "Education",
              ),
              EditCard(
                boxHeight: 370,
                fieldList: [
                  ['LeetCode', 'leetcode_icon'],
                  ['CodeForces', 'codeforces_icon'],
                  ['Hacker Rank', 'hacker_rank_icon'],
                  ['GitHub', 'github_icon'],
                ],
                title: "Developer Handles",
              ),
              EditCard(fieldList: [
                ['Linkedin', 'linkedin_icon'],
                ['Telegram', 'telegram_icon']
              ], title: "Socials", boxHeight: 229)
            ]),
          ),
        ],
      ),
    ));
  }
}
