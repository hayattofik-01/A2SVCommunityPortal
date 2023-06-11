import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String telegramUsername;
  final String country;
  final String phoneNumber;
  final String university;
  final String department;
  final int? graduationYear;
  final String favoriteLanguage;
  final String password;
  final String cv;
  final String shortBio;
  final String leetCode;
  final String hackerRank;
  final String codeForces;
  final String gitHub;
  final String linkedIn;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.telegramUsername,
    required this.codeForces,
    required this.password,
    this.country = '',
    this.phoneNumber = '',
    this.university = '',
    this.department = '',
    this.graduationYear,
    this.favoriteLanguage = '',
    this.cv = '',
    this.shortBio = '',
    this.leetCode = '',
    this.hackerRank = '',
    this.gitHub = '',
    this.linkedIn = '',
  });

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        telegramUsername,
        country,
        phoneNumber,
        university,
        department,
        graduationYear,
        favoriteLanguage,
        password,
        cv,
        shortBio,
        leetCode,
        hackerRank,
        codeForces,
        gitHub,
        linkedIn
      ];
}
