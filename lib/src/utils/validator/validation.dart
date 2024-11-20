class TValidator {
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }

    return null;
  }

  // Email validation
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // Regular expression for validating an Email
    String emailPattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(emailPattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null; // Return null if the email is valid
  }

  // Password validation
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}<>]'))) {
      return 'Password must contain at least one special character.';
    }

    return null;
  }

  // Phone number validation
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Regular expression for validating a phone number (simple pattern)
    String phonePattern = r'^\+?[0-9]{7,15}$';
    RegExp regex = RegExp(phonePattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid phone number';
    }

    return null; // Return null if the phone number is valid
  }
}
