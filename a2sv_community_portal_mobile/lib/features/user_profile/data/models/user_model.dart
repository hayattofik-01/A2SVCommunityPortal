import 'package:a2sv_community_portal_mobile/features/user_profile/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String fullName,
    required String email,
    required String telegramUsername,
    required String codeforcesHandle,
    String? country,
    required String phoneNumber,
    String? university,
    String? department,
    int? graduationYear,
    String? favoriteLanguage,
    String? cv,
    String? shortBio,
    String? leetCodeHandle,
    String? hackerrankHandle,
    String? gitHubHandle,
    String? linkedInHandle,
    String? profilePicture,
  }) : super(
          fullName: fullName,
          email: email,
          telegramUsername: telegramUsername,
          codeforcesHandle: codeforcesHandle,
          country: country,
          phoneNumber: phoneNumber,
          university: university,
          department: department,
          graduationYear: graduationYear,
          favoriteLanguage: favoriteLanguage,
          cv: cv,
          shortBio: shortBio,
          leetCodeHandle: leetCodeHandle,
          hackerrankHandle: hackerrankHandle,
          gitHubHandle: gitHubHandle,
          linkedInHandle: linkedInHandle,
          profilePicture: profilePicture,
        );

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'telegramUsername': telegramUsername,
      'country': country,
      'phoneNumber': phoneNumber,
      'university': university,
      'department': department,
      'graduationYear': graduationYear,
      'favoriteLanguage': favoriteLanguage,
      'cv': cv,
      'shortBio': shortBio,
      'leetCodeHandle': leetCodeHandle,
      'hackerrankHandle': hackerrankHandle,
      'codeforcesHandle': codeforcesHandle,
      'gitHubHandle': gitHubHandle,
      'linkedInHandle': linkedInHandle,
      'profilePicture': profilePicture
    };
  }

  // Create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        fullName: json['fullName'],
        email: json['email'],
        telegramUsername: json['telegramUsername'],
        phoneNumber: json['phoneNumber'],
        country: json['country'],
        university: json['university'],
        department: json['department'],
        graduationYear: json['graduationYear'],
        favoriteLanguage: json['favoriteLanguage'],
        cv: json['cv'],
        shortBio: json['shortBio'],
        leetCodeHandle: json['leetCodeHandle'],
        hackerrankHandle: json['hackerrankHandle'],
        codeforcesHandle: json['codeforcesHandle'],
        gitHubHandle: json['gitHubHandle'],
        linkedInHandle: json['linkedInHandle'],
        profilePicture: json['profilePicture']);
  }
}
