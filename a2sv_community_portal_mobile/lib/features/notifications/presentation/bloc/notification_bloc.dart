import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/usecases/get_notifications.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/usecases/send_is_read.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  GetNotification getNotifications;
  SendIsRead sendIsRead;
  NotificationBloc({required this.getNotifications, required this.sendIsRead})
      : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      if (event is GetNotificationsEvent) {
        emit(NotificationLoading());

        final response = await getNotifications();

        response.fold(
            (error) => emit(NotificationError(errorMessage: error.toString())),
            (notifications) async {
          emit(NotificationLoaded(notifications: notifications));
          await sendIsRead();
        });
      }
    });
  }
}
