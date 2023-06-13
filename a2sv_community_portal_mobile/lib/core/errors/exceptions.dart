class ServerException implements Exception {
  final String message;

  ServerException(this.message);
}

class CacheException implements Exception {
  final String message;

  CacheException(this.message);
}

class UserNotFoundException implements Exception {
  final String message;

  UserNotFoundException(this.message);
}

class InputException implements Exception {
  final String message;

  InputException(this.message);
}

class LoginFailedException implements Exception {
  final String message;

  LoginFailedException(this.message);
}
