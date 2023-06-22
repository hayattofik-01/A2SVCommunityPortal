import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: UIConverter.getDeviceWidth(context) > 700
            ? 124
            : UIConverter.getComponentWidth(context, 124),
        height: UIConverter.getComponentHeight(context, 48),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              color: whiteColor,
              fontSize: UIConverter.getComponentHeight(context, 18),
              height: 1.2, // equivalent to line-height: 24px
              letterSpacing: 0.02,
            ),
          ),
        ),
      ),
    );
  }
}
