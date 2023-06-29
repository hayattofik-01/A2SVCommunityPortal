import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/core/utils/media_query.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpperBar extends StatelessWidget implements PreferredSizeWidget {
  const UpperBar({Key? key})
      : super(key: key); // Add Key parameter and use const with constructor

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: whiteColor,
      title: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome',
                  style: TextStyle(fontSize: 14, color: whiteGreyColor),
                ),
                SizedBox(height: 4.0), // Use const with SizedBox constructor
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
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push('/home/notifications');
              context.read<NotificationBloc>().add(GetNotificationsEvent());
            },
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: greyColorForIcon, // Use const with Color constructor
                  ),
                  padding: const EdgeInsets.all(5),
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(top: 5),
                  child: const Icon(
                    Icons.notifications,
                    color: blueBlackForAppBar,
                    size: 24,
                  ),
                ),
                Container(
                  width: 11,
                  height: 11,
                  margin: const EdgeInsets.only(left: 33, top: 2),
                  decoration: const BoxDecoration(
                    color: primaryColor, // Use const with Color constructor
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Use const with Size constructor
}
