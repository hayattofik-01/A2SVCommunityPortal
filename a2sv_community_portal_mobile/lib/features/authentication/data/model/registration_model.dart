
import '../../domain/entities/registration_payload.dart';

class RegistrationPayloadEntity extends RegistrationPayload {
 
  const RegistrationPayloadEntity({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String codeforces,
    required String telegram,
    required String password,
    required String confirmPassword,
  }) : super(
          fullName: fullName,
          email: email,
          phoneNumber: phoneNumber,
          codeforces: codeforces,
          telegram: telegram,
          password: password,
          confirmPassword: confirmPassword,
        );
  
}