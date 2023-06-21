import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:flutter/material.dart';

class EditField extends StatelessWidget {
  const EditField({super.key, required this.hintText, required this.iconName});
  final String iconName;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          0, UIConverter.getComponentHeight(context, 16), 0, 0),
      child: Container(
          height: UIConverter.getComponentHeight(context, 55),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 243, 246, 249),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 10, 16),
                child: Center(
                  child: ImageIcon(
                    AssetImage("/images/$iconName.png"),
                    color: const Color(
                      0XFF1A365D,
                    ),
                    size: UIConverter.getComponentHeight(context, 20),
                  ),
                )),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: UIConverter.getComponentHeight(context, 25)),
                  hintText: hintText,
                  hintStyle: const TextStyle(
                      color: Color(0xFFCBD5E0),
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
