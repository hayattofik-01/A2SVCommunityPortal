import 'dart:math';
import 'package:a2sv_community_portal_mobile/features/user_profile/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/profile_bloc.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture(
      {super.key, required this.profilePicture, required this.user});
  final String profilePicture;
  final UserEntity user;

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
    ImageProvider imageProvider;
    if (profilePicture == "No") {
      imageProvider = const AssetImage('assets/images/no_profile.jpg');
    } else {
      imageProvider = NetworkImage(profilePicture);
    }
    ImagePicker picker = ImagePicker();
    XFile? image;
    return SizedBox(
      width: pictureSize,
      height: pictureSize,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.fitWidth,
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () async {
                image = await picker.pickImage(source: ImageSource.gallery);

                final newUser = UserEntity(
                    fullName: user.fullName,
                    email: user.email,
                    telegramUsername: user.telegramUsername,
                    codeforcesHandle: user.codeforcesHandle,
                    country: user.country,
                    phoneNumber: user.phoneNumber,
                    university: user.university,
                    department: user.department,
                    graduationYear: user.graduationYear,
                    leetCodeHandle: user.leetCodeHandle,
                    hackerrankHandle: user.hackerrankHandle,
                    gitHubHandle: user.gitHubHandle,
                    linkedInHandle: user.linkedInHandle,
                    profilePicture: image!.path,
                    shortBio: user.shortBio,
                    favoriteLanguage: user.favoriteLanguage);
                context
                    .read<ProfileBloc>()
                    .add(EditProfilePictureEvent(user: newUser));
              },
              child: Container(
                width: editIconSize,
                height: editIconSize,
                decoration: const BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/images/edit_icon_2.svg',
                    width: editIconSize * 0.6,
                    height: editIconSize * 0.6,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
