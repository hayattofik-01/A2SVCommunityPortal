import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/contest/data/model/contest.dart';
import 'package:a2sv_community_portal_mobile/features/contest/domain/entities/contest.dart';
import 'package:http/http.dart' as http;

abstract class ContestRemoteDataSource {
  Future<List<Contest>> getContests();
}

class ContestRemoteDataSourceImpl implements ContestRemoteDataSource {
  final http.Client client;
  String uri = "https://api";

  ContestRemoteDataSourceImpl(this.client);

  @override
  Future<List<Contest>> getContests() async {
    final response = await client.get(
      Uri.parse(uri),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsonContests = json.decode(response.body) as List<dynamic>;
      return jsonContests
          .map((jsonContest) => ContestModel.fromJson(jsonContest) as Contest)
          .toList();
    } else {
      throw ServerException(serverFaliure);
    }
  }
}

