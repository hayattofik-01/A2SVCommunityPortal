import 'dart:convert';
import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/constants.dart';

abstract class ApplicationStepRemoteDataSource {
  Future<dynamic> getApplicationStepFromApi();
}

class ApplicationStepRemoteDataSourceImpl
    implements ApplicationStepRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  ApplicationStepRemoteDataSourceImpl(
      {required this.client, required this.sharedPreferences});

  @override
  Future<dynamic> getApplicationStepFromApi() async {
    String token =
        jsonDecode(sharedPreferences.getString(cachedToken)!)['token'];
    final response = await client.get(
      Uri.parse(
          'https://a2sv-community-portal-api.onrender.com/api/Progress/me'),
      headers: {
        'content-type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode != 200) {
      throw ServerException('server error');
    } else {
      final responseBody = jsonDecode(response.body);
      return responseBody['value'];
    }
  }
}
