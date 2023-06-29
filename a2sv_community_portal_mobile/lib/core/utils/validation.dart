class Validator {
  static String? noValidation(String? value) {
    return null;
  }

  static String? validateName(String? value) {
    // Check if the value is empty
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    // Define the regular expression pattern
    const namePattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    // Create a regular expression object
    final regExp = RegExp(namePattern);

    // Check if the value matches the pattern
    if (!regExp.hasMatch(value)) {
      return 'Invalid name format';
    }

    // Check if the length is within the allowed range
    if (value.length < 2 || value.length > 50) {
      return 'Name should be between 2 and 50 characters';
    }

    // Return null if the value is valid
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // Define the regular expression pattern
    const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$';

    // Create a regular expression object
    final regExp = RegExp(emailPattern);

    // Check if the value matches the pattern
    if (!regExp.hasMatch(value)) {
      return 'Invalid email format';
    }

    // Return null if the value is valid
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Define the regular expression pattern
    const phonePattern = r'^\d{10}$';

    // Create a regular expression object
    final regExp = RegExp(phonePattern);

    // Check if the value matches the pattern
    if (!regExp.hasMatch(value)) {
      return 'Invalid phone number format';
    }

    // Return null if the value is valid
    return null;
  }

  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'handle is required';
    }

    // Define the regular expression pattern
    const usernamePattern = r'^[a-zA-Z0-9_-]{3,20}$';

    // Create a regular expression object
    final regExp = RegExp(usernamePattern);

    // Check if the value matches the pattern
    if (!regExp.hasMatch(value)) {
      return 'Invalid handle  format';
    }

    // Return null if the value is valid
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    // Check if the password meets the minimum length requirement
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check if the password contains at least one uppercase letter, one lowercase letter, and one digit
    final hasUppercase = value.contains(RegExp(r'[A-Z]'));
    final hasLowercase = value.contains(RegExp(r'[a-z]'));
    final hasDigit = value.contains(RegExp(r'\d'));

    if (!hasUppercase || !hasLowercase || !hasDigit) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, and one digit';
    }

    // Return null if the value is valid
    return null;
  }

  static String? validateNoSpace(String? value) {
    final RegExp noSpaceRegExp = RegExp(r'^\S+$');
    if (value != null && !noSpaceRegExp.hasMatch(value)) {
      return 'Spaces are not allowed.';
    }

    return null; // Return null if the value is valid
  }

  static String? validateCodeforces(String? value) {
    final RegExp noSpaceRegExp = RegExp(r'^\S+$');
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }

    if (!noSpaceRegExp.hasMatch(value)) {
      return 'Spaces are not allowed.';
    }

    return null; // Return null if the value is valid
  }
}
