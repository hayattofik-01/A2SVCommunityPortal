import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String header;
  final String date;
  final String time;

  const CustomListTile({
    super.key,
    required this.header,
    required this.date,
    required this.time,
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
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: blackColor,
          ),
        ),
        subtitle: Container(
          padding: const EdgeInsets.only(top: 5, bottom: 0),
          child: Text(
            '$date  $time',
            style: const TextStyle(
              color: tileTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
