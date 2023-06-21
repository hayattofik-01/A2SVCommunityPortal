import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/media_query.dart';

class TitleBar extends StatelessWidget {
  const TitleBar({super.key, required this.title, required this.iconName});
  final String title;
  final String iconName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: UIConverter.getComponentHeight(context, 8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/back_icon.svg",
                color: const Color(0xFF343434), width: 8, height: 16),
          ),
          Text(
            title,
            style: const TextStyle(
                color: Color(0xFF343434),
                fontFamily: 'Urbanist',
                fontSize: 24,
                fontWeight: FontWeight.w600,
                height: 1),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/images/$iconName.svg",
                color: const Color(0xFF3182CE), width: 18, height: 18),
          ),
        ],
      ),
    );
  }
}
