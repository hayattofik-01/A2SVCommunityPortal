import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Notification entity', () {
    const title = 'Test Notification';
    const content = 'This is a test notification.';
    const type = 'test';
    const isRead = false;

    test('should create a notification with the given values', () {
      const notification = Notification(
        title: title,
        content: content,
        type: type,
        isRead: isRead,
      );

      expect(notification.title, equals(title));
      expect(notification.content, equals(content));
      expect(notification.type, equals(type));
      expect(notification.isRead, equals(isRead));
    });

    test('should override equality correctly', () {
      const notification1 = Notification(
        title: title,
        content: content,
        type: type,
        isRead: isRead,
      );
      const notification2 = Notification(
        title: title,
        content: content,
        type: type,
        isRead: isRead,
      );

      expect(notification1, equals(notification2));
    });
  });
}
