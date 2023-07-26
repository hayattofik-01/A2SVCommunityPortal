import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'content_box.dart';
import 'icon_with_description.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({
    super.key,
    required this.department,
    required this.university,
    required this.graduationYear,
  });
  final String department;
  final String university;
  final int graduationYear;
  @override
  Widget build(BuildContext context) {
    return ContentBox(
      boxHeight: 20,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              "Education",
              style: TextStyle(
                  color: cardTitleColor,
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: 15.5.sp),
            ),
          ),
          IconWithDescription(
            description: "$university | $graduationYear",
            iconName: "school_icon",
          ),
          IconWithDescription(iconName: "cap_icon", description: department)
        ]),
      ),
    );
  }
}
