import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/data/model/announcement_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/repository/announcement_datasource.dart';
import 'package:http/http.dart' as http;

class DataSource implements AnnouncementRemoteDataSource {
  final http.Client client;
  final url;
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI0NTY4NzQzNi1jYThhLTRhYTUtODA1Ny1lNGRlYjAwNzBlZGQiLCJqdGkiOiIyNTNiNTk0OC04ZTQ5LTQ5OWEtYWJmOC1lMTI4ZWI0MmNjNTUiLCJlbWFpbCI6ImVAMTIzLmNvbSIsInVuaXF1ZV9uYW1lIjoiZUAxMjMuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiU3R1ZGVudCIsImV4cCI6MTY5MDEzNzI1MCwiaXNzIjoiQTJTViBDb21tdW5pdHkgUG9ydGFsIiwiYXVkIjoiQTJTViBDb21tdW5pdHkgUG9ydGFsIn0.b7_7BaFc5ViprskPLD8fwNaY0soLEL-u07HupaAVBVY";
  DataSource({required this.client})
      : url = Uri.parse(
            "https://a2sv-community-portal-api.onrender.com/api/Blogs");
  @override
  Future<List<AnnouncementModel>> getAnnouncements() async {
    final response = await client.get(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List<AnnouncementModel> announcements = jsonBody
          .map((eachJsonBody) => AnnouncementModel.fromJson(eachJsonBody))
          .toList();

      return Future.value(announcements);
    } else {
      throw ServerException(serverFaliure);
    }
  }
}
