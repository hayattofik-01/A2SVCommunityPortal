import 'package:flutter/material.dart';
import '../../../../core/utils/media_query.dart';
import 'content_box.dart';
import 'icon_with_description.dart';

class EducationCard extends StatelessWidget {
  const EducationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentBox(
      boxHeight: 200,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            child: Text(
              "Education",
              style: TextStyle(
                  color: const Color.fromRGBO(0, 0, 0, 0.64),
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.w600,
                  fontSize: UIConverter.getComponentHeight(context, 16)),
            ),
          ),
          const IconWithDescription(
            description: "Addis Ababa University | 2024",
            iconName: "school_icon",
          ),
          const IconWithDescription(
              iconName: "cap_icon", description: "SoftWare Engineering")
        ]),
      ),
    );
  }
}
