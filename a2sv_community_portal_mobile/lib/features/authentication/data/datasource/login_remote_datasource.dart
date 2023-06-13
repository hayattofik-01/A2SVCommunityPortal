import 'dart:convert';

import 'package:a2sv_community_portal_mobile/core/errors/exceptions.dart';
import 'package:a2sv_community_portal_mobile/core/utils/constants.dart';
import '../../domain/entities/login.dart';
import '../model/login_model.dart';
import 'package:http/http.dart' as http;

abstract class LoginRemoteDataSource {
  Future<Login> loginUser(String email, String password);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  
final baseUrl = 'https://mocki.io/v1/a1c63369-aaee-437c-a86a-ee544f50268a';
  final http.Client client;
  LoginRemoteDataSourceImpl({required this.client});

  @override
  Future<LoginModel> loginUser(String email, String password) async {
    final response = await client.post(Uri.parse(baseUrl),body:jsonEncode({
      'email': email,
      'password': password,
    }));
    if (response.statusCode == 401){
      throw LoginFailedException(LOGIN_FAILED);
    }
    if (response.statusCode != 200) {
      throw ServerException(SERVER_FALIURE);
    }
    return LoginModel.fromJson(jsonDecode(response.body));
  }
}