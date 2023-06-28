import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/failures.dart';
import 'package:a2sv_community_portal_mobile/features/announcement_page/data/model/announcement_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../domain/repository/announcement_datasource.dart';
import 'package:http/http.dart' as http;

class DataSource implements AnnouncementRemoteDataSource {
  final http.Client client;
  final url;
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlNmM1MmQ1Ny0yNGI2LTQ1MjQtYmUxMC1lYjdiY2U0ZDMyMTciLCJqdGkiOiIwM2YzNGU2NS1iZDA0LTQ0ZGMtYTM2MC03Mzc1MmM0MzA3MTEiLCJlbWFpbCI6ImFkbWluQGxvY2FsaG9zdC5jb20iLCJ1bmlxdWVfbmFtZSI6ImFkbWluQGxvY2FsaG9zdC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJIZWFkT2ZFZHVjYXRpb24iLCJleHAiOjE2OTA0MTU4NjYsImlzcyI6IkEyU1YgQ29tbXVuaXR5IFBvcnRhbCIsImF1ZCI6IkEyU1YgQ29tbXVuaXR5IFBvcnRhbCJ9.ki_D9QAQwHVS1e62TKvIuJNdFhb5jyF-cjiGN4t4hUY";
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
