import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/content_box.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/media_query.dart';
import 'icon_with_description.dart';

class DeveloperHandelCard extends StatelessWidget {
  const DeveloperHandelCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentBox(
      boxHeight: 200,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              "Developer Handel",
              style: TextStyle(
                  color: const Color.fromRGBO(0, 0, 0, 0.64),
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: UIConverter.getComponentHeight(context, 16)),
            ),
          ),
          Row(
            children: const [
              IconWithDescription(
                description: "LeetCode",
                iconName: "leetcode_icon",
                handle: "simongreat",
              ),
              SizedBox(
                width: 33,
              ),
              IconWithDescription(
                iconName: "hacker_rank_icon",
                description: "HackerRank",
                handle: "simongreat",
              ),
            ],
          ),
          Row(
            children: const [
              IconWithDescription(
                description: "CodeForces",
                iconName: "codeforces_icon",
                handle: "simongreat",
              ),
              SizedBox(
                width: 20,
              ),
              IconWithDescription(
                iconName: "github_icon",
                description: "Github",
                handle: "simongreat",
              ),
            ],
          )
        ]),
      ),
    );
  }
}
