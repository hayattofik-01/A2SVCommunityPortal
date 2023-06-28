import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/content_box.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/edit_field.dart';
import 'package:flutter/material.dart';

class EditCard extends StatelessWidget {
  const EditCard({
    super.key,
    required this.fieldList,
    required this.title,
    required this.boxHeight,
    this.bio = false,
    required this.controllers,
  });
  final List<List<dynamic>> fieldList;
  final String title;
  final double boxHeight;
  final Map<String, TextEditingController> controllers;
  final bool bio;

  @override
  Widget build(BuildContext context) {
    return ContentBox(
        boxHeight: boxHeight,
        child: Container(
          padding: EdgeInsets.all(UIConverter.getComponentHeight(context, 16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                child: Text(
                  title,
                  style: const TextStyle(
                      color: cardTitleColor,
                      fontFamily: 'Urbanist',
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
              ),
              Column(
                children: fieldList
                    .map((fieldData) => EditField(
                          hintText: fieldData[0],
                          iconName: fieldData[1],
                          controllers: controllers,
                          validator: fieldData[2],
                        ))
                    .toList(),
              ),
              if (bio == true)
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, UIConverter.getComponentHeight(context, 16), 0, 0),
                  child: Container(
                    height: UIConverter.getComponentHeight(context, 143),
                    decoration: BoxDecoration(
                      color: inputFieldColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                          fontFamily: 'Urbanist', fontWeight: FontWeight.w400),
                      controller: controllers["Bio"],
                      maxLines: 3,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(
                            UIConverter.getComponentHeight(context, 16)),
                        hintText: "Bio",
                        hintStyle: const TextStyle(
                            color: hintTextColor,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
