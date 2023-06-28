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
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmNGNhMWMwNy02NmFhLTQ4MzMtOGUwMC1iMzY0ODhkNjE1ZGUiLCJqdGkiOiJkNmI4YTU5NS05ZWMzLTQ1ZTUtYWZiZS02NmNiYmUwODY5OWQiLCJlbWFpbCI6InNhZEBhMnN2Lm9yZyIsInVuaXF1ZV9uYW1lIjoic2FkQGEyc3Yub3JnIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiU3R1ZGVudCIsImV4cCI6MTY5MDQ4NDc1NCwiaXNzIjoiQTJTViBDb21tdW5pdHkgUG9ydGFsIiwiYXVkIjoiQTJTViBDb21tdW5pdHkgUG9ydGFsIn0.8GgMZ9KY3VFFvxiwKzpmflfvqCoSZnrBUOq1on2cfVo";
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
