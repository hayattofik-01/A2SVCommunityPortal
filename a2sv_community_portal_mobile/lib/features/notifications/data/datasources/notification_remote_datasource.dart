import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/data/model/notification.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';
import 'package:http/http.dart' as http;

abstract class NotificationRemoteDataSource {
  Future<List<Notification>> getNotifications();
  Future<void> sendIsRead();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final http.Client client;
  String baseUri =
      "https://a2sv-community-portal-api.onrender.com/api/Notifications";
  String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlNmM1MmQ1Ny0yNGI2LTQ1MjQtYmUxMC1lYjdiY2U0ZDMyMTciLCJqdGkiOiIwM2YzNGU2NS1iZDA0LTQ0ZGMtYTM2MC03Mzc1MmM0MzA3MTEiLCJlbWFpbCI6ImFkbWluQGxvY2FsaG9zdC5jb20iLCJ1bmlxdWVfbmFtZSI6ImFkbWluQGxvY2FsaG9zdC5jb20iLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJIZWFkT2ZFZHVjYXRpb24iLCJleHAiOjE2OTA0MTU4NjYsImlzcyI6IkEyU1YgQ29tbXVuaXR5IFBvcnRhbCIsImF1ZCI6IkEyU1YgQ29tbXVuaXR5IFBvcnRhbCJ9.ki_D9QAQwHVS1e62TKvIuJNdFhb5jyF-cjiGN4t4hUY";
  NotificationRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Notification>> getNotifications() async {
    final response = await client.get(
      Uri.parse("$baseUri?pageNumber=1&pageSize=10"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      final jsonNotifications = jsonResponse["value"]["items"] as List<dynamic>;
      final notifications = jsonNotifications
          .map((jsonNotification) =>
              NotificationModel.fromJson(jsonNotification))
          .toList();

      return Future.value(notifications);
    } else {
      throw ServerException(serverFaliure);
    }
  }

  @override
  Future<void> sendIsRead() async {
    // Send a post request with the bool body to the backend.
    final response = await client.post(
      Uri.parse(baseUri),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw ServerException(serverFaliure);
    }
  }
}
