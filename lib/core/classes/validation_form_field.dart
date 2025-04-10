import 'package:flutter/cupertino.dart';

class FormValidator {
  /// ✅ Required Field Validation
  static String? isRequired(String? value, {String fieldName = "Field"}) {
    if (value == null || value.trim().isEmpty) {
      return "$fieldName is required";
    }
    return null;
  }

  /// ✅ Email Validation
  static String? isValidEmail(String? value) {
    if (value == null || value.isEmpty) return "Email is required";
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) return "Enter a valid email address";
    return null;
  }

  /// ✅ Password Validation (8+ chars, uppercase, lowercase, number, special character)
  static String? isValidPassword(String? value) {
    if (value == null || value.isEmpty) return "Password is required";
    if (value.length < 8) return "Password must be at least 8 characters long";
    if (!RegExp(r'[A-Z]').hasMatch(value))
      return "Password must contain an uppercase letter";
    if (!RegExp(r'[a-z]').hasMatch(value))
      return "Password must contain a lowercase letter";
    if (!RegExp(r'[0-9]').hasMatch(value))
      return "Password must contain a number";
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return "Password must contain a special character (!@#\$%^&*)";
    }
    return null;
  }

  /// ✅ Confirm Password Validation (matches the original password)
  static String? isPasswordMatch(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) return "Confirm password is required";
    if (value != originalPassword) return "Passwords do not match";
    return null;
  }

  /// ✅ Username Validation (3-20 chars, only letters & numbers)
  static String? isValidUsername(String? value) {
    if (value == null || value.isEmpty) return "Username is required";
    if (value.length < 3 || value.length > 20) {
      return "Username must be between 3 and 20 characters long";
    }
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return "Username can only contain letters, numbers, and underscores";
    }
    return null;
  }

  /// ✅ Phone Number Validation (10-15 digits)
  static String? isValidPhoneNumber(String? value) {
    if (value == null || value.isEmpty) return "Phone number is required";
    if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
      return "Enter a valid phone number (10-15 digits)";
    }
    return null;
  }

  /// ✅ Only Numeric Values Allowed
  static String? isNumeric(String? value, {String fieldName = "Value"}) {
    if (value == null || value.isEmpty) return "$fieldName is required";
    if (!RegExp(r'^\d+$').hasMatch(value)) return "$fieldName must be a number";
    return null;
  }

  /// ✅ Minimum Length Validation
  static String? hasMinLength(String? value, int minLength,
      {String fieldName = "Field"}) {
    if (value == null || value.isEmpty) return "$fieldName is required";
    if (value.length < minLength)
      return "$fieldName must be at least $minLength characters long";
    return null;
  }

  /// ✅ Maximum Length Validation
  static String? hasMaxLength(String? value, int maxLength,
      {String fieldName = "Field"}) {
    if (value == null || value.isEmpty) return "$fieldName is required";
    if (value.length > maxLength)
      return "$fieldName must be at most $maxLength characters long";
    return null;
  }

  /// ✅ URL Validation
  static String? isValidURL(String? value) {
    if (value == null || value.isEmpty) return "URL is required";
    final regex = RegExp(r'^(https?:\/\/)?([\w\d\-]+\.)+\w{2,}(\/.*)?$');
    if (!regex.hasMatch(value)) return "Enter a valid URL";
    return null;
  }

  static String? isEmpty(String? value) {
    if (value == null || value.isEmpty) return "field can't be null";
    return null;
  }

  static String? valueBetween(String? value) {
    if (value == null || value.isEmpty) return "field can't be null";
    if (value.length < 3 || value.length > 20) {
      return "Username must be between 3 and 20 characters long";
    }
    return null;
  }

  static String? isPercentage(String? value) {
    String? result ;
    if (value == null || value.isEmpty) return "field can't be null";

    result = isNumeric(value);
    if(result != null ) return result;

    int? number = int.tryParse(value);
    if(number == null) return "Percentage must be valid number";

    if(number < 0 || number > 100) return "Percentage must be between 0 and 100";

    return null ;

  }
}
