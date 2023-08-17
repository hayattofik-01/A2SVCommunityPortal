import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/data/model/announcement_model.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/domain/entities/announcement.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import 'package:http/http.dart' as http;

abstract class AnnouncementRemoteDataSource {
  Future<List<Announcement>> getAnnouncements();
}

class DataSource implements AnnouncementRemoteDataSource {
  final http.Client client;
  final url;
  final SharedPreferences sharedPreferences;
  DataSource({required this.client, required this.sharedPreferences})
      : url = Uri.parse(
            "https://a2sv-community-portal-api.onrender.com/api/Blogs");
  @override
  Future<List<AnnouncementModel>> getAnnouncements() async {
    String token =
        jsonDecode(sharedPreferences.getString(cachedToken)!)['token'];
    final response = await client.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body)['value'];
      final List<AnnouncementModel> announcements =
          jsonBody.map<AnnouncementModel>((e) {
        return AnnouncementModel.fromJson(e);
      }).toList();

      // final List<AnnouncementModel> announcements = jsonBody
      // .map((eachJsonBody) => AnnouncementModel.fromJson(eachJsonBody))
      // .toList();

      debugPrint(announcements.runtimeType.toString());

      return Future.value(announcements);
    } else {
      throw ServerException(serverFaliure);
    }
  }
}
