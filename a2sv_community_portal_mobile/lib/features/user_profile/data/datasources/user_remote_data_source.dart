import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';

import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/user_entity.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> editUserProfile(UserEntity user);
  Future<UserModel> getUser(String userId);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;
  String uri = "https://api";
  UserRemoteDataSourceImpl({required this.client});
  @override
  Future<UserModel> editUserProfile(UserEntity user) async {
    UserModel userModel = user as UserModel;
    final response = await client.put(
      Uri.parse(uri),
      body: jsonEncode(userModel.toJson()),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(serverFaliure);
    }
  }

  @override
  Future<UserModel> getUser(String userId) async {
    final response = await client.get(
      Uri.parse(uri),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException(serverFaliure);
    }
  }
}
