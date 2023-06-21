import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String title;
  final String description;
  final bool done;

  const CustomCard({
    Key? key,
    required this.title,
    required this.description,
    required this.done,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horPadding = UIConverter.getComponentHeight(context, 15);
    return Container(
      width: UIConverter.getDeviceWidth(context) >= 600
          ? UIConverter.getComponentWidth(context, 150)
          : null,
      margin: EdgeInsets.only(
        left: UIConverter.getComponentWidth(context, 27),
        top: UIConverter.getComponentHeight(context, 41),
        right: UIConverter.getComponentWidth(context, 27),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.06),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            blurRadius: 3,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(horPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                done
                    ? const Icon(
                        Icons.check_circle,
                        color: Color(0xFF3182CE),
                      )
                    : const Icon(
                        Icons.radio_button_unchecked_rounded,
                        color: Color(0xFF3182CE),
                      ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(0, 0, 0, 0.326),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
