import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/colors.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 14, color: greyTextColor),
                ),
                SizedBox(height: 4.0), // Adds spacing between the texts
                Text(
                  'Joe Doe',
                  style: TextStyle(
                      fontSize: 20,
                      color: userNameColor,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: (){
                GoRouter.of(context).push('/contests/notifications');
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: backgroundWhite),
                    padding: const EdgeInsets.all(5),
                    height: 46,
                    width: 46,
                    margin: const EdgeInsets.only(top: 5),
                    child: const Icon(
                      Icons.notifications,
                      color: iconColor,
                      size: 24,
                    ),
                  ),
                  Container(
                    width: 11.0,
                    height: 11.0,
                    margin: const EdgeInsets.only(left: 33, top: 2),
                    decoration: const BoxDecoration(
                      color: buttonColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
