class Validation {
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
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    return null; // Return null if the password is valid
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
