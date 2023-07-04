import 'package:a2sv_community_portal_mobile/features/notifications/data/model/notification.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';

void main() {
  group('NotificationModel', () {
    const notificationModel = NotificationModel(
      title: 'Test title',
      content: 'Test content',
      type: 'Test type',
      isRead: false,
    );

    test('should extend Notification entity', () {
      expect(notificationModel, isA<Notification>());
    });

    test('should have correct props', () {
      expect(notificationModel.props, [
        notificationModel.title,
        notificationModel.content,
        notificationModel.type,
        notificationModel.isRead
      ]);
    });

    test('should convert to json', () {
      final json = notificationModel.toJson();
      expect(json, {
        'title': 'Test title',
        'content': 'Test content',
        'type': 'Test type'
      });
    });

    test('should convert from json', () {
      final json = {
        'title': 'Test title',
        'content': 'Test content',
        'type': 'Test type',
        'isRead': true,
      };
      final notificationModelFromJson = NotificationModel.fromJson(json);
      expect(notificationModelFromJson.title, 'Test title');
      expect(notificationModelFromJson.content, 'Test content');
      expect(notificationModelFromJson.type, 'Test type');
      expect(notificationModelFromJson.isRead, true);
    });
  });
}
