import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:flutter/material.dart';

class UpperBar extends StatelessWidget implements PreferredSizeWidget {
  const UpperBar({Key? key})
      : super(key: key); // Add Key parameter and use const with constructor

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
                SizedBox(height: 4.0), // Use const with SizedBox constructor
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
                  color: greyColorForIcon, // Use const with Color constructor
                ),
                padding: const EdgeInsets.all(5),
                height: UIConverter.getComponentHeight(context, 50),
                width: UIConverter.getComponentWidth(context, 50),
                margin: const EdgeInsets.only(top: 5),
                child: const Icon(
                  Icons.notifications,
                  color: blueBlackForAppBar,
                  size: 24,
                ),
              ),
              Container(
                width: UIConverter.getComponentWidth(context, 11),
                height: UIConverter.getComponentHeight(context, 11),
                margin: const EdgeInsets.only(left: 33, top: 2),
                decoration: const BoxDecoration(
                  color: primary, // Use const with Color constructor
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
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Use const with Size constructor
}
