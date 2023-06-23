import '../../domain/entities/login.dart';


class LoginModel extends Login {
 
  const LoginModel({required String token}) : super(token: token);

   Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }

  static LoginModel fromJson(Map<String, dynamic> json) {
    return LoginModel(
      token: json ['value']['token']);
    
  }
}