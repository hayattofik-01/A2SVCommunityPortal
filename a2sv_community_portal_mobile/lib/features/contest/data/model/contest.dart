import 'package:equatable/equatable.dart';

class ContestModel extends Equatable {
  final String title;
  final String description;
  final DateTime date;
  final String link;

  const ContestModel({
    required this.title,
    required this.description,
    required this.date,
    required this.link,
  });

  @override
  List<Object?> get props => [title, description, date, link];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'link': link,
    };
  }

  static ContestModel fromJson(Map<String, dynamic> json) {
    return ContestModel(
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      link: json['link'] as String,
    );
  }
}
