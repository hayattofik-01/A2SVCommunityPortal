import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/content_box.dart';
import 'package:flutter/material.dart';
import 'icon_with_description.dart';

class SocialCard extends StatelessWidget {
  const SocialCard(
      {super.key, required this.linkedInHandle, required this.telegramHandle});
  final String linkedInHandle;
  final String telegramHandle;
  @override
  Widget build(BuildContext context) {
    return ContentBox(
        boxHeight: 133,
        child: Container(
            padding:
                EdgeInsets.all(UIConverter.getComponentHeight(context, 16)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Text(
                  "Socials",
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
                    child: IconWithDescription(
                      description: "Linkedin",
                      iconName: "linkedin_icon",
                      handle: linkedInHandle,
                      url: "https://linkedin/in/",
                    ),
                  ),
                  SizedBox(
                    width: UIConverter.getComponentWidth(context, 30),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconWithDescription(
                      iconName: "telegram_icon",
                      description: "Telegram",
                      handle: telegramHandle,
                      url: "https://t.me/",
                    ),
                  ),
                ],
              ),
            ])));
  }
}
