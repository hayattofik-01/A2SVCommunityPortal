import 'package:equatable/equatable.dart';

class Notification extends Equatable {
  final String title;
  final String content;
  final String type;
  final bool isRead;

  const Notification(
      {required this.title,
      required this.content,
      required this.type,
      required this.isRead});
  @override
  List<Object?> get props => [title, content, type, isRead];
}
