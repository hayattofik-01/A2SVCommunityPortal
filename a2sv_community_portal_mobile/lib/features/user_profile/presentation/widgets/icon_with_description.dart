import 'dart:math';

import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class IconWithDescription extends StatelessWidget {
  const IconWithDescription(
      {super.key,
      required this.iconName,
      required this.description,
      this.handle = "",
      this.url = ""});
  final String iconName;
  final String description;
  final String handle;
  final String url;

  @override
  Widget build(BuildContext context) {
    final double iconSize = min(
      UIConverter.getComponentHeight(context, 46),
      UIConverter.getComponentWidth(context, 46),
    );
    return GestureDetector(
      onTap: () async {
        if (handle != "") {
          final Uri uri = Uri.parse('$url$handle');
          launchUrl(uri);
        }
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: Row(
          children: [
            Container(
              height: iconSize,
              width: iconSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: greyColorForIcon),
              child: Center(
                  child: SvgPicture.asset("assets/images/$iconName.svg")),
            ),
            SizedBox(
              width: UIConverter.getComponentHeight(context, 20),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    description,
                    style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: UIConverter.getComponentHeight(context, 16),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                if (handle != "")
                  Container(
                    width: 80,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        handle,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            color: handleColor,
                            fontFamily: 'Poppins',
                            fontSize:
                                UIConverter.getComponentHeight(context, 12),
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
