import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegistrationPayload extends Equatable{
  final String fullName;
  final String email;
  final String phoneNumber;
  final String codeforces;
  final String telegram;
  final String password;
  final String confirmPassword;

  const RegistrationPayload({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.codeforces,
    required this.telegram,
    required this.password,
    required this.confirmPassword,
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'codeforces': codeforces,
      'telegram': telegram,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  static RegistrationPayload fromJson(String jsonString) {
    final jsonData = jsonDecode(jsonString);
    return RegistrationPayload(
      fullName: jsonData['fullName'],
      email: jsonData['email'],
      phoneNumber: jsonData['phoneNumber'],
      codeforces: jsonData['codeforces'],
      telegram: jsonData['telegram'],
      password: jsonData['password'],
      confirmPassword: jsonData['confirmPassword'],
    );
  }
  
  @override
  
  List<Object?> get props => [fullName,email,phoneNumber,codeforces,telegram,password,confirmPassword];
}