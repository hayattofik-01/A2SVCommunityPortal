import 'package:equatable/equatable.dart';

import '../../data/models/user_model.dart';

class UserEntity extends Equatable {
  final String fullName;
  final String email;
  final String telegramUsername;
  final String? country;
  final String phoneNumber;
  final String? university;
  final String? department;
  final int? graduationYear;
  final String? favoriteLanguage;
  final String? cv;
  final String? shortBio;
  final String? leetCodeHandle;
  final String? hackerrankHandle;
  final String codeforcesHandle;
  final String? gitHubHandle;
  final String? linkedInHandle;
  final String? profilePicture;

  const UserEntity(
      {required this.fullName,
      required this.email,
      required this.telegramUsername,
      required this.codeforcesHandle,
      this.country,
      required this.phoneNumber,
      this.university,
      this.department,
      this.graduationYear,
      this.favoriteLanguage,
      this.cv,
      this.shortBio,
      this.leetCodeHandle,
      this.hackerrankHandle,
      this.gitHubHandle,
      this.linkedInHandle,
      this.profilePicture});

  UserModel toUserModel() {
    return UserModel(
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
  }

  @override
  List<Object?> get props => [
        fullName,
        email,
        telegramUsername,
        country,
        phoneNumber,
        university,
        department,
        graduationYear,
        favoriteLanguage,
        cv,
        shortBio,
        leetCodeHandle,
        hackerrankHandle,
        codeforcesHandle,
        gitHubHandle,
        linkedInHandle,
        profilePicture,
      ];
}
