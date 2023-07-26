import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/country.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/entities/user_entity.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/content_box.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';
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
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: bioTextColor);
    return ContentBox(
      boxHeight: 29,
      child: Padding(
        padding: EdgeInsets.all(1.6.h),
        child: Column(children: [
          SizedBox(
            height: 12.7.h,
            child: Row(
              children: [
                ProfilePicture(
                  profilePicture: profilePicture,
                  user: user,
                ),
                SizedBox(
                  width: 5.w,
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
                          fontSize: 16.sp,
                          color: infoNameColor),
                    ),
                    Row(
                      children: [
                        SizedBox(
                            height: 18,
                            width: 18,
                            child: CircleFlag(isvalid(country)!)),
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
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: primaryColor)),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 12.h,
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
                            fontSize: 15.5.sp,
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
                          fontSize: 14.5.sp,
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
