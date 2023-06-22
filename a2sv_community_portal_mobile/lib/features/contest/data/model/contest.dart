import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:equatable/equatable.dart';

class ContestModel extends Contest {
  final String title;
  final String description;
  final DateTime date;
  final String link;

  const ContestModel({
    required this.title,
    required this.description,
    required this.date,
    required this.link,
  }) : super(title: '', description: '', date: date, link: '');

  @override
  List<Object?> get props => [title, description, date, link];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'link': link,
    };
  }

  static ContestModel fromJson(Map<String, dynamic> json) {
    return ContestModel(
      title: json['title'] as String? ?? 'No title available',
      description: json['description'] as String? ?? 'No description available',
      date: DateTime.parse(json['date'] as String),
      link: json['link'] as String? ?? 'No link available',
    );
  }
}
