import 'dart:math';

import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    final pictureSize = min(
      UIConverter.getComponentHeight(context, 100),
      UIConverter.getComponentWidth(context, 100),
    );
    final editIconSize = min(
      UIConverter.getComponentHeight(context, 30),
      UIConverter.getComponentWidth(context, 30),
    );

    return SizedBox(
      width: pictureSize,
      height: pictureSize,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/profile_image.png'),
                  fit: BoxFit.fitWidth,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: editIconSize,
              height: editIconSize,
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  '/images/edit_icon_2.svg',
                  width: editIconSize * 0.6,
                  height: editIconSize * 0.6,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
