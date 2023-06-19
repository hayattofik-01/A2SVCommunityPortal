import 'package:equatable/equatable.dart';

class Contest extends Equatable {
  final String title;
  final String description;
  final DateTime date;
  final String link;

  const Contest({
    required this.title,
    required this.description,
    required this.date,
    required this.link,
  });

  @override
  List<Object?> get props => [title, description, date, link];
}
