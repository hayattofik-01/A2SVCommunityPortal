import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/entities/user_entity.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/content_box.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/utils/media_query.dart';
import 'package:flutter_circle_flags_svg/flutter_circle_flags_svg.dart';

class BioCard extends StatelessWidget {
  const BioCard(
      {super.key,
      required this.user,
      required this.name,
      required this.email,
      required this.country,
      required this.resume,
      required this.phoneNumber,
      required this.shortBio,
      required this.profilePicture});
  final String name;
  final String email;
  final String country;
  final String resume;
  final String phoneNumber;
  final String shortBio;
  final String profilePicture;
  final UserEntity user;
  @override
  Widget build(BuildContext context) {
    final TextStyle biotextStyle = TextStyle(
        height: 1,
        fontFamily: 'Urbanist',
        fontSize: UIConverter.getComponentHeight(context, 14),
        fontWeight: FontWeight.w600,
        color: bioTextColor);
    return ContentBox(
      boxHeight: 245,
      child: Padding(
        padding: EdgeInsets.all(UIConverter.getComponentHeight(context, 16)),
        child: Column(children: [
          SizedBox(
            height: UIConverter.getComponentHeight(context, 127),
            child: Row(
              children: [
                ProfilePicture(
                  profilePicture: profilePicture,
                  user: user,
                ),
                SizedBox(
                  width: UIConverter.getComponentWidth(context, 20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                          fontSize: UIConverter.getComponentHeight(context, 16),
                          color: infoNameColor),
                    ),
                    Row(
                      children: [
                        SizedBox(
                            height: 18,
                            width: 18,
                            child: CircleFlag(countryCode[country]!)),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(country, style: biotextStyle),
                        )
                      ],
                    ),
                    Text(email, style: biotextStyle),
                    Text(phoneNumber, style: biotextStyle),
                    GestureDetector(
                      onTap: () {
                        final Uri uri = Uri.parse(user.cv!);
                        launchUrl(uri);
                      },
                      child: Text("Résumé",
                          style: TextStyle(
                              height: 1,
                              fontFamily: 'Urbanist',
                              fontSize:
                                  UIConverter.getComponentHeight(context, 14),
                              fontWeight: FontWeight.w600,
                              color: primaryColor)),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: UIConverter.getComponentHeight(context, 80),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text("Bio",
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Urbanist',
                            fontSize:
                                UIConverter.getComponentHeight(context, 16),
                            fontWeight: FontWeight.w600,
                            color: cardTitleColor)),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(shortBio,
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Urbanist',
                          fontSize: UIConverter.getComponentHeight(context, 14),
                          fontWeight: FontWeight.w500,
                          color: bioTextColor)),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
