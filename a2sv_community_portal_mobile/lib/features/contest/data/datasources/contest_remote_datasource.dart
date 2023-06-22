import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/model/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:http/http.dart' as http;

abstract class ContestRemoteDataSource {
  Future<List<Contest>> getUpcomingContests();
  Future<List<Contest>> getPastContests();
}

class ContestRemoteDataSourceImpl implements ContestRemoteDataSource {
  final http.Client client;
  String uri = "https://a2sv-community-portal-api.onrender.com/api/Contests";
  String token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlYWZlMzhkNS03NzU3LTQ4YjMtYTM5Yy1mZDI2YTBhYjkyZTQiLCJqdGkiOiI4MGM3ZWE0ZC1kYjFlLTQxZWMtOTk1Yi01Y2U3NGQwZmFkY2EiLCJlbWFpbCI6InRlbXBAZ21haWwuY29tIiwidW5pcXVlX25hbWUiOiJ0ZW1wQGdtYWlsLmNvbSIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IlN0dWRlbnQiLCJleHAiOjE2ODk5NjU0NjgsImlzcyI6IkEyU1YgQ29tbXVuaXR5IFBvcnRhbCIsImF1ZCI6IkEyU1YgQ29tbXVuaXR5IFBvcnRhbCJ9.b8rnzkNB080ICnvLnlsCtOJ_y3sa1AifUM-I0_5mRbw';

  ContestRemoteDataSourceImpl({required this.client});
  @override
  Future<List<Contest>> getPastContests() async {
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
