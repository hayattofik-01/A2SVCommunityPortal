import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Login extends Equatable {
  final String token;

  Login({required this.token}) : super();
  
  @override
  // TODO: implement props
  List<Object?> get props => [token];
}
