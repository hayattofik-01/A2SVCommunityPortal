class PasswordConfirmationValidator {
  static String? validate(String value, String confirmation) {
    if (value != confirmation) {
      return "Passwords do not match";
    }
    return null;
  }
}