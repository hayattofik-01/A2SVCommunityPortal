import 'package:a2sv_community_portal_mobile/core/utils/colors.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/bloc/notification_bloc.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/presentation/widgets/notifications_widger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/uppe_bar.dart';

class NotificationPage extends StatelessWidget {
  NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationBloc, NotificationState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: ListView(
            children: const [
              UpperBar(
                title: 'Notification',
              ),
              SizedBox(
                height: 20,
              ),
              Notifications_Widget()
            ],
          ),
        );
      },
    );
  }
}
