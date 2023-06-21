import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/content_box.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/profile_picture.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/media_query.dart';
import 'package:flutter_circle_flags_svg/flutter_circle_flags_svg.dart';

class BioCard extends StatelessWidget {
  const BioCard({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle biotextStyle = TextStyle(
        height: 1,
        fontFamily: 'Urbanist',
        fontSize: UIConverter.getComponentHeight(context, 14),
        fontWeight: FontWeight.w600,
        color: const Color.fromRGBO(0, 0, 0, 0.48));
    return ContentBox(
      boxHeight: 241,
      child: Padding(
        padding: EdgeInsets.all(UIConverter.getComponentHeight(context, 16)),
        child: Column(children: [
          SizedBox(
            height: UIConverter.getComponentHeight(context, 121),
            child: Row(
              children: [
                const ProfilePicture(),
                SizedBox(
                  width: UIConverter.getComponentWidth(context, 20),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Beth Biruk",
                      style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontWeight: FontWeight.w600,
                          fontSize: UIConverter.getComponentHeight(context, 16),
                          color: const Color.fromRGBO(0, 0, 0, 0.8)),
                    ),
                    Row(
                      children: [
                        SizedBox(
                            height: 18,
                            width: 18,
                            child: CircleFlag(countryCode["Ethiopia"]!)),
                        Text(" Ethiopia", style: biotextStyle)
                      ],
                    ),
                    Text("Beth.biruk@gmail.com", style: biotextStyle),
                    Text("+251 0912432453", style: biotextStyle),
                    Text("Résumé",
                        style: TextStyle(
                            height: 1,
                            fontFamily: 'Urbanist',
                            fontSize:
                                UIConverter.getComponentHeight(context, 14),
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF3182CE)))
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
                            color: const Color.fromRGBO(0, 0, 0, 0.64))),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                      '''Nunc vulputate libero et velit interdum, ac aliquet odio mattis''',
                      style: TextStyle(
                          height: 1,
                          fontFamily: 'Urbanist',
                          fontSize: UIConverter.getComponentHeight(context, 14),
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(0, 0, 0, 0.48))),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
