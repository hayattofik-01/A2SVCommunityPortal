import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditField extends StatelessWidget {
  const EditField({
    super.key,
    required this.hintText,
    required this.iconName,
    required this.controllers
  });
  final String iconName;
  final String hintText;
  final Map<String, TextEditingController> controllers;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, UIConverter.getComponentHeight(context, 16), 0, 0),
      child: Container(
          height: UIConverter.getComponentHeight(context, 55),
          decoration: BoxDecoration(
            color: inputFieldColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 10, 16),
                child: Center(
                  child: SvgPicture.asset(
                    ("assets/images/$iconName.svg"),
                    color: blueBlackForAppBar,
                    height: UIConverter.getComponentHeight(context, 20),
                    width: UIConverter.getComponentHeight(context, 20),
                  ),
                )),
            Expanded(
              child: TextFormField(
                controller: controllers[hintText],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: UIConverter.getComponentHeight(context, 20)),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      color: hintTextColor,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                  border: InputBorder.none,
                ),
              ),
            )
          ])),
    );
  }
}
