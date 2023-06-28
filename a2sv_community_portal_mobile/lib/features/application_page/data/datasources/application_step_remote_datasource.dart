import 'dart:convert';
import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;

abstract class ApplicationStepRemoteDataSource {
  Future<dynamic> getApplicationStepFromApi();
}

class ApplicationStepRemoteDataSourceImpl
    implements ApplicationStepRemoteDataSource {
  final http.Client client;

  ApplicationStepRemoteDataSourceImpl({required this.client});
  String token =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI4MjU3Yzk2Yy0yNDUwLTQ0Y2QtOTUwYi0zZmJkNjMxNWU3MmUiLCJqdGkiOiI5ODY1NTM4MS1kZTNlLTQ2YWMtYWQ0My04ZmExMTY3OWY3YTMiLCJlbWFpbCI6ImR1cmVAYTJzdi5vcmciLCJ1bmlxdWVfbmFtZSI6ImR1cmVAYTJzdi5vcmciLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJTdHVkZW50IiwiZXhwIjoxNjkwNTY3MjIyLCJpc3MiOiJBMlNWIENvbW11bml0eSBQb3J0YWwiLCJhdWQiOiJBMlNWIENvbW11bml0eSBQb3J0YWwifQ.CUPSeW32p_gmNYBQLXk8mg-iqMslnRWeMQCAI3TNiv0";
  @override
  Future<dynamic> getApplicationStepFromApi() async {
    final response = await client.get(
      Uri.parse(
          'https://a2sv-community-portal-api.onrender.com/api/Progress/me'),
      headers: {'content-type': 'application/json', 'Authorization': token},
    );

    if (response.statusCode != 200) {
      throw ServerException('server error');
    } else {
      final responseBody = jsonDecode(response.body);
      return responseBody['value'];
    }
  }
}
