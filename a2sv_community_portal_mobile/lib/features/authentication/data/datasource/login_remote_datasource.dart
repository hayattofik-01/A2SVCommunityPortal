import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import 'package:a2sv_community_portal_mobile/features/authentication/domain/entities/registration_payload.dart';
import '../../domain/entities/login.dart';
import '../model/login_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<Login> loginUser(String email, String password);
  Future<Login> registerUser(RegistrationPayload user);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final loginUrl =
      'https://a2sv-community-portal-api.onrender.com/api/Auth/login';
  final registerUrl =
      'https://a2sv-community-portal-api.onrender.com/api/Auth/register';
        final headers = {
    'Content-Type': 'application/json',
    'Authorization': '<API Key>',
  };
  final http.Client client;
  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel> loginUser(String email, String password) async {
    final response = await client.post(Uri.parse(loginUrl),

    
     headers: headers,
        body: jsonEncode({
          'email': email,
          'password': password
        }));
              

    if (response.statusCode == 400) {
      throw LoginFailedException(loginFailed);
    }
    if (response.statusCode != 200) {
      throw ServerException(serverFaliure);
    }
    return LoginModel.fromJson(jsonDecode(response.body));
  }
  

  @override
  Future<Login> registerUser(
      RegistrationPayload user ) async {
       
    final response = await client.post(Uri.parse(registerUrl),
        headers: headers,
        body: jsonEncode(user.toJson()));

    if (response.statusCode == 400) {
      throw LoginFailedException(loginFailed);
    }

    if (response.statusCode != 200) {
      throw ServerException(serverFaliure);
    }
    return LoginModel.fromJson(jsonDecode(response.body));
  }
}
