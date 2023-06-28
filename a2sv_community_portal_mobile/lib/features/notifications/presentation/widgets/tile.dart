import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CustomListTile extends StatelessWidget {
  final String header;
  final String description;
  final String type;
  final bool isRead;

  const CustomListTile({
    super.key,
    required this.header,
    required this.description,
    required this.type,
    required this.isRead,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        border: Border.all(color: boxBorderColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(
          header,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: userNameColor,
            fontFamily: "Urbanist",
          ),
        ),
        subtitle: Container(
          padding: const EdgeInsets.only(top: 5, bottom: 0),
          child: Html(
            data: description,
            // description,
            // style: const TextStyle(
            //   color: Color.fromRGBO(74, 85, 104, 1),
            //   fontWeight: FontWeight.w500,
            //   fontSize: 14,
            //   fontFamily: "Urbanist",
            // ),
          ),
        ),
        trailing: Container(
          width: 9.0,
          height: 9.0,
          margin: const EdgeInsets.only(left: 0, bottom: 35),
          decoration: BoxDecoration(
            color: isRead
                ? backgroundWhite
                :  buttonColor,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
