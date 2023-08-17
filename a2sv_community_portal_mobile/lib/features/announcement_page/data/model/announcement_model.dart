import 'package:flutter/foundation.dart';

import '../../domain/entities/announcement.dart';

class AnnouncementModel extends Announcement {
  AnnouncementModel({
    required String title,
    required String description,
  }) : super(
          title: '',
          description: '',
        );

  @override
  List<Object?> get props => [title, description];

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }

  static AnnouncementModel fromJson(Map<String, dynamic> json) {
    debugPrint(json.toString());
    return AnnouncementModel(
      title: json['title'] ?? 'No title available',
      description: json['description'] ?? 'No description available',
    );
  }
}
