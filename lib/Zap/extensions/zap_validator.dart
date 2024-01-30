part of 'package:zapx/zapx.dart';

/// Extension providing common validation methods for ZapInterface.
extension ZapValidator on ZapInterface {
  /// Validates if the given [value] is a valid email address.
  bool isValidEmail(String value) {
    if (value.isEmpty) {
      return false;
    }
    return RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$').hasMatch(value);
  }

  /// Validates if the given [value] is a valid password.
  /// Optionally, you can set [minLength], [requireUppercase], [requireDigit],
  /// and [requireSpecialChar] to enforce specific password criteria.
  bool isValidPassword(
    String value, {
    int minLength = 6,
    bool requireUppercase = false,
    bool requireDigit = false,
    bool requireSpecialChar = false,
  }) {
    if (value.length < minLength) {
      return false;
    } else if (requireUppercase && !RegExp(r'[A-Z]').hasMatch(value)) {
      return false;
    } else if (requireDigit && !RegExp(r'\d').hasMatch(value)) {
      return false;
    } else if (requireSpecialChar &&
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return false;
    }

    return true;
  }

  /// Validates if the given [value] is a valid 10-digit phone number.
  bool isValidPhoneNumber(String value) {
    if (value.isEmpty) {
      return false;
    }

    if (!RegExp(r'^\d{10}$').hasMatch(value)) {
      return false;
    }

    return true;
  }

  /// Validates if the given [value] is a valid URL with specified [validSchemes].
  bool isValidUrl(
    String value, {
    List<String> validSchemes = const ['http', 'https'],
  }) {
    if (value.isEmpty) {
      return false;
    }

    try {
      Uri uri = Uri.parse(value);
      return validSchemes.contains(uri.scheme);
    } catch (_) {
      // Consider logging the error or handling it differently.
      return false;
    }
  }
}
