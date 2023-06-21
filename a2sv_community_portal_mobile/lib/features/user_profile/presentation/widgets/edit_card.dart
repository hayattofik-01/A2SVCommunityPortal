import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/content_box.dart';
import 'package:a2sv_community_portal_mobile/features/user_profile/presentation/widgets/edit_field.dart';
import 'package:flutter/material.dart';

class EditCard extends StatelessWidget {
  const EditCard(
      {super.key,
      required this.fieldList,
      required this.title,
      required this.boxHeight});
  final List<List<String>> fieldList;
  final String title;
  final double boxHeight;
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
                      color: Color.fromRGBO(0, 0, 0, 0.64),
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
                        ))
                    .toList(),
              )
            ],
          ),
        ));
  }
}
