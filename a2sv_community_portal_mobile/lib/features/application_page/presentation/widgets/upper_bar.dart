import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:flutter/material.dart';

class UpperBar extends StatelessWidget implements PreferredSizeWidget {
  const UpperBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 14, color: Color.fromRGBO(168, 168, 168, 1)),
                ),
                SizedBox(height: 4.0), // Adds spacing between the texts
                Text(
                  'Joe Doe',
                  style: TextStyle(
                      fontSize: 20,
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(235, 248, 255, 1),
                ),
                padding: const EdgeInsets.all(5),
                height: UIConverter.getComponentHeight(context, 50),
                width: UIConverter.getComponentWidth(context, 50),
                margin: const EdgeInsets.only(top: 5),
                child: const Icon(
                  Icons.notifications,
                  color: Color.fromRGBO(26, 54, 93, 1),
                  size: 24,
                ),
              ),
              Container(
                width: UIConverter.getComponentWidth(context, 11),
                height: UIConverter.getComponentHeight(context, 11),
                margin: const EdgeInsets.only(left: 33, top: 2),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(49, 130, 206, 1),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
