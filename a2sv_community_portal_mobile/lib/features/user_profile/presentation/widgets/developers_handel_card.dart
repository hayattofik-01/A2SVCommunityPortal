import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/content_box.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/media_query.dart';
import 'icon_with_description.dart';

class DeveloperHandelCard extends StatelessWidget {
  const DeveloperHandelCard({
    super.key,
    required this.hackerrankHandle,
    required this.codeforcesHandle,
    required this.leetCodeHandle,
    required this.gitHubHandle,
  });
  final String hackerrankHandle;
  final String codeforcesHandle;
  final String leetCodeHandle;
  final String gitHubHandle;
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
                  color: cardTitleColor,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: UIConverter.getComponentHeight(context, 16)),
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconWithDescription(
                      description: "LeetCode",
                      iconName: "leetcode_icon",
                      handle: leetCodeHandle,
                      url: 'https://leetcode.com/',
                    ),
                    IconWithDescription(
                      iconName: "github_icon",
                      description: "Github",
                      handle: gitHubHandle,
                      url: 'https://github.com/',
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: UIConverter.getComponentWidth(context, 30),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconWithDescription(
                      description: "CodeForces",
                      iconName: "codeforces_icon",
                      handle: codeforcesHandle,
                      url: 'https://codeforces.com/profile/',
                    ),
                    IconWithDescription(
                      iconName: "hacker_rank_icon",
                      description: "HackerRank",
                      handle: hackerrankHandle,
                      url: 'https://hackerrank.com/',
                    ),
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
