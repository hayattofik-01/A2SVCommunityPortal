import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/model/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

abstract class ContestRemoteDataSource {
  Future<List<Contest>> getUpcomingContests();
  Future<List<Contest>> getPastContests();
}

class ContestRemoteDataSourceImpl implements ContestRemoteDataSource {
  final http.Client client;
  final SharedPreferences sharedPreferences;
  String uri = "https://a2sv-community-portal-api.onrender.com/api/Contests";

  ContestRemoteDataSourceImpl(
      {required this.client, required this.sharedPreferences});
  @override
  Future<List<Contest>> getPastContests() async {
    String token =
        jsonDecode(sharedPreferences.getString(cachedToken)!)['token'];
    final response = await client.get(
      Uri.parse("$uri/recent"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      final jsonContests = json.decode(response.body)["value"] as List<dynamic>;
      final contests = jsonContests
          .map((jsonContest) => ContestModel.fromJson(jsonContest))
          .toList();

      return Future.value(contests);
    } else {
      throw ServerException(serverFaliure);
    }
  }

  @override
  Future<List<Contest>> getUpcomingContests() async {
    String token =
        jsonDecode(sharedPreferences.getString(cachedToken)!)['token'];
    final response = await client.get(
      Uri.parse("$uri/upcoming"),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      final jsonContests = json.decode(response.body)["value"] as List<dynamic>;
      final contests = jsonContests
          .map((jsonContest) => ContestModel.fromJson(jsonContest))
          .toList();

      return Future.value(contests);
    } else {
      throw ServerException(serverFaliure);
    }
  }
}
