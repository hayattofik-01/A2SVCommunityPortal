import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';

class NotificationModel extends Notification {
  final String title;
  final String content;
  final String type;
  final bool isRead;

  const NotificationModel(
      {required this.title,
      required this.content,
      required this.type,
      required this.isRead})
      : super(title: '', content: '', type: '', isRead: false);

  @override
  List<Object?> get props => [title, content, type, isRead];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'type': type,
    };
  }

  static NotificationModel fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      title: json['title'] as String? ?? 'No title available',
      content: json['content'] as String? ?? 'No content available',
      type: json['type'] as String? ?? "No type available",
      isRead: json['isRead'],
    );
  }
}
