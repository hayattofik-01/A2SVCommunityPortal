import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  final SharedPreferences sharedPreferences;
  String uri = "https://a2sv-community-portal-api.onrender.com/api/Profile/me";
  UserRemoteDataSourceImpl(
      {required this.client, required this.sharedPreferences});

  @override
  Future<UserModel> editUserProfile(UserEntity user) async {
    String token =
        jsonDecode(sharedPreferences.getString(cachedToken)!)['token'];
    final userModel = user.toUserModel().toJson();
    final request = http.MultipartRequest('POST', Uri.parse(uri));
    request.headers['Authorization'] = "Bearer $token";

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
    String token =
        jsonDecode(sharedPreferences.getString(cachedToken)!)['token'];
    final response = await client.get(
      Uri.parse(uri),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return UserModel.fromJson(json.decode(response.body)['value']);
    } else {
      throw ServerException(serverFaliure);
    }
  }
}
