import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/data/model/notification.dart';
import 'package:a2sv_community_portal_mobile/features/notifications/domain/entities/notification.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class NotificationRemoteDataSource {
  Future<List<Notification>> getNotifications();
  Future<void> sendIsRead();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  String baseUri =
      "https://a2sv-community-portal-api.onrender.com/api/Notifications";

  NotificationRemoteDataSourceImpl(
      {required this.client, required this.sharedPreferences});
  @override
  Future<List<Notification>> getNotifications() async {
    String token =
        jsonDecode(sharedPreferences.getString(cachedToken)!)['token'];
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
    String token =
        jsonDecode(sharedPreferences.getString(cachedToken)!)['token'];
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
