import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/media_query.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
    required this.title,
    required this.iconName,
    required this.action,
  });
  final String title;
  final String iconName;
  final VoidCallback action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: UIConverter.getComponentHeight(context, 8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<ProfileBloc>().add(const GetProfileEvent());
            },
            icon: SvgPicture.asset("assets/images/back_icon.svg",
                color: appBarColor, width: 8, height: 16),
          ),
          Text(
            title,
            style: const TextStyle(
                color: appBarColor,
                fontFamily: 'Urbanist',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 1),
          ),
          IconButton(
            onPressed: action,
            icon: SvgPicture.asset("assets/images/$iconName.svg",
                color: primaryColor, width: 18, height: 18),
          ),
        ],
      ),
    );
  }
}
