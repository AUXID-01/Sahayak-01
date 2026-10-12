class AppValidators {
  static String? requiredField(String? value, [String message = 'This field is required']) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your email';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter your phone number';
    }
    final cleanPhone = value.replaceAll(RegExp(r'\D'), '');
    if (cleanPhone.length < 10) {
      return 'Enter a valid 10-digit phone number';
    }
    return null;
  }

  static String? password(String? value, [int minLength = 6]) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }
    return null;
  }

  static String? aadhaarOrId(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an Aadhaar or official ID';
    }
    if (value.trim().length < 4) {
      return 'ID must be at least 4 characters long';
    }
    return null;
  }
}
