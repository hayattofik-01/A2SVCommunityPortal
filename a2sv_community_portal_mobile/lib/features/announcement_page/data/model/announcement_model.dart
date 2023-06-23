import 'package:a2sv_community_portal_mobile/features/announcement_page/domain/entities/announcement.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'announcement_model.freezed.dart';
part 'announcement_model.g.dart';

@freezed
class AnnouncementModel extends Announcement with _$AnnouncementModel {
  const factory AnnouncementModel({
    required String title,
    required String description,
  }) = _AnnouncementModel;

  factory AnnouncementModel.fromJson(Map<String, Object?> json) =>
      _$AnnouncementModelFromJson(json);
}
