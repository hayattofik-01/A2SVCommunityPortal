import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import '../../../user_profile/data/models/user_model.dart';
import '../../domain/entities/login.dart';
import '../model/login_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<Login> loginUser(String email, String password);
  Future<Login> registerUser(UserModel user);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  
final loginUrl = 'https://a2sv-community-portal-api.onrender.com/api/Auth/login';
final registerUrl = 'https://a2sv-community-portal-api.onrender.com/api/Auth/register';
final http.Client client;
  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel> loginUser(String email, String password) async {
    final response = await client.post(Uri.parse(loginUrl),body:jsonEncode({
      'email': email,
      'password': password,
    }));
    if (response.statusCode == 401){
      throw LoginFailedException(loginFailed);
    }
    if (response.statusCode != 200) {
      throw ServerException(serverFaliure);
    }
    return LoginModel.fromJson(jsonDecode(response.body));
  }
@override
  Future<LoginModel> registerUser(UserModel user) async {
    final response = await client.post(Uri.parse(registerUrl),body: user.toJson());
      
    if (response.statusCode != 200) {
      throw ServerException(serverFaliure);
    }
    return LoginModel.fromJson(jsonDecode(response.body));
  }
}