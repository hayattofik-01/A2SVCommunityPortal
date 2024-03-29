import 'package:a2sv_community_portal_mobile/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpperBar extends StatelessWidget {
  const UpperBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 16.0, right: 16.0),
      child: Row(
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
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                GoRouter.of(context).push('/contests/notifications');
                context.read<NotificationBloc>().add(GetNotificationsEvent());
              },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color.fromRGBO(235, 248, 255, 1)),
                    padding: const EdgeInsets.all(5),
                    height: 46,
                    width: 46,
                    margin: const EdgeInsets.only(top: 5),
                    child: const Icon(
                      Icons.notifications,
                      color: Color.fromRGBO(26, 54, 93, 1),
                      size: 24,
                    ),
                  ),
                  Container(
                    width: 11.0,
                    height: 11.0,
                    margin: const EdgeInsets.only(left: 33, top: 2),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(49, 130, 206, 1),
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
