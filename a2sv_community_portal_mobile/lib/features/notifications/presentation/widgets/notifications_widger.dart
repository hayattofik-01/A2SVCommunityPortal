import 'package:a2sv_community_portal_mobile/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/widgets/tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Notifications_Widget extends StatelessWidget {
  const Notifications_Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
        builder: (context, state) {
      if (state is NotificationLoading) {
        return Container(
          alignment: Alignment.center,
          width: 50,
          height: 50,
          child: const CircularProgressIndicator(),
        );
      } else if (state is NotificationLoaded) {
     
        return Column(
          children: <Widget>[
            for (var notification in state.notifications)
              Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: CustomListTile(
                    header: notification.title,
                    description: notification.content,
                    type: notification.type,
                    isRead: notification.isRead,
                  ))
          ],
        );
      } else if (state is NotificationError) {
        return Text(state.errorMessage);
      } else {
        return Container();
      }
    });
  }
}
