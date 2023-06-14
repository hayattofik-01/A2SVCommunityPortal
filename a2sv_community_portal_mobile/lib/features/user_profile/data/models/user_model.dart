import 'package:a2sv_community_portal_mobile/features/user_profile/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String id,
    required String name,
    required String email,
    required String telegramUsername,
    required String codeForces,
    required String password,
    String country = '',
    String phoneNumber = '',
    String university = '',
    String department = '',
    int? graduationYear,
    String favoriteLanguage = '',
    String cv = '',
    String shortBio = '',
    String leetCode = '',
    String hackerRank = '',
    String gitHub = '',
    String linkedIn = '',
  }) : super(
          id: id,
          name: name,
          email: email,
          telegramUsername: telegramUsername,
          codeForces: codeForces,
          password: password,
          country: country,
          phoneNumber: phoneNumber,
          university: university,
          department: department,
          graduationYear: graduationYear,
          favoriteLanguage: favoriteLanguage,
          cv: cv,
          shortBio: shortBio,
          leetCode: leetCode,
          hackerRank: hackerRank,
          gitHub: gitHub,
          linkedIn: linkedIn,
        );

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'telegramUsername': telegramUsername,
      'country': country,
      'phoneNumber': phoneNumber,
      'university': university,
      'department': department,
      'graduationYear': graduationYear,
      'favoriteLanguage': favoriteLanguage,
      'password': password,
      'cv': cv,
      'shortBio': shortBio,
      'leetCode': leetCode,
      'hackerRank': hackerRank,
      'codeForces': codeForces,
      'gitHub': gitHub,
      'linkedIn': linkedIn,
    };
  }

  // Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      telegramUsername: json['telegramUsername'],
      country: json['country'],
      phoneNumber: json['phoneNumber'],
      university: json['university'],
      department: json['department'],
      graduationYear: json['graduationYear'],
      favoriteLanguage: json['favoriteLanguage'],
      password: json['password'],
      cv: json['cv'],
      shortBio: json['shortBio'],
      leetCode: json['leetCode'],
      hackerRank: json['hackerRank'],
      codeForces: json['codeForces'],
      gitHub: json['gitHub'],
      linkedIn: json['linkedIn'],
    );
  }
}
