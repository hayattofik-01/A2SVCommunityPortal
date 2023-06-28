import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> editUserProfile(UserEntity user);
  Future<UserModel> getUser();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  String uri = "https://a2sv-community-portal-api.onrender.com/api/Profile/me";
  String token =
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI4MjU3Yzk2Yy0yNDUwLTQ0Y2QtOTUwYi0zZmJkNjMxNWU3MmUiLCJqdGkiOiI5ODY1NTM4MS1kZTNlLTQ2YWMtYWQ0My04ZmExMTY3OWY3YTMiLCJlbWFpbCI6ImR1cmVAYTJzdi5vcmciLCJ1bmlxdWVfbmFtZSI6ImR1cmVAYTJzdi5vcmciLCJodHRwOi8vc2NoZW1hcy5taWNyb3NvZnQuY29tL3dzLzIwMDgvMDYvaWRlbnRpdHkvY2xhaW1zL3JvbGUiOiJTdHVkZW50IiwiZXhwIjoxNjkwNTY3MjIyLCJpc3MiOiJBMlNWIENvbW11bml0eSBQb3J0YWwiLCJhdWQiOiJBMlNWIENvbW11bml0eSBQb3J0YWwifQ.CUPSeW32p_gmNYBQLXk8mg-iqMslnRWeMQCAI3TNiv0";
  UserRemoteDataSourceImpl({required this.client});
  @override
  Future<UserModel> editUserProfile(UserEntity user) async {
    final userModel = user.toUserModel().toJson();
    final request = http.MultipartRequest('POST', Uri.parse(uri));
    request.headers['Authorization'] = token;

    userModel.forEach((key, value) async {
      if (value != null) {
        if (key != "profilePicture" && key != 'cv') {
          request.fields[key] = value.toString();
        } else {
          final file = await http.MultipartFile.fromPath(key, value);
          request.files.add(file);
        }
      }
    });

    final response = await request.send();
    final responseBody = await http.Response.fromStream(response);
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(responseBody.body)['value']);
    } else {
      throw ServerException(serverFaliure);
    }
  }

  @override
  Future<UserModel> getUser() async {
    final response = await client.get(
      Uri.parse(uri),
      headers: {'Content-Type': 'application/json', 'Authorization': token},
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body)['value']);
    } else {
      throw ServerException(serverFaliure);
    }
  }
}
