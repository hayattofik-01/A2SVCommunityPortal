import 'package:equatable/equatable.dart';

class Announcement extends Equatable {
  final String title;
  final String description;

  const Announcement({
    required this.title,
    required this.description,
  });
  @override
  List<Object?> get props => [title, description];
}
