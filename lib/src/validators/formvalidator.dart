import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'regexp.dart';

typedef ValidateFunction<T> = bool Function(T? value);
typedef ConditionalValidateFunction<T> = bool Function(
    T? value, T? conditionalValue);

class ConditionalFieldValidator<T> extends FormValidator<T> {
  final String conditionalFieldKey;
  final ConditionalValidateFunction<T> validate;

  const ConditionalFieldValidator({
    required super.errorMessage,
    required this.conditionalFieldKey,
    required this.validate,
  });

  @override
  List<Object> get props => [super.errorMessage, conditionalFieldKey, validate];
}

class FieldValidator<T> extends FormValidator<T> {
  final ValidateFunction<T> validate;

  const FieldValidator({
    required super.errorMessage,
    required this.validate,
  });

  @override
  List<Object> get props => [super.errorMessage, validate];
}

abstract class FormValidator<T> extends Equatable {
  final String errorMessage;

  const FormValidator({
    required this.errorMessage,
  });
}

class FormValidators {
  /// Ensures that a field is not empty.
  ///
  /// This validator checks if the value provided is non-null and not empty. It is type-flexible,
  /// meaning it works for non-string types by simply checking if the value is non-null, and for strings,
  /// it additionally checks that the string is not empty.
  ///
  /// Parameters:
  /// - `errorMessage`: A `String` that specifies the error message to be displayed if validation fails.
  ///
  /// Returns:
  /// A `FieldValidator<T>` that validates whether the field is non-empty.
  static FieldValidator<T> required<T>(String errorMessage) =>
      FieldValidator<T>(
          validate: (T? value) => value is String?
              ? (value != null && value.isNotEmpty)
              : value != null,
          errorMessage: errorMessage);

  /// Validates that a field contains a valid email address.
  ///
  /// This validator checks if the input string matches the email pattern defined in `AppRegExp`.
  /// It can optionally allow empty values to be considered valid if `enableEmpty` is set to true.
  ///
  /// Parameters:
  /// - `errorMessage`: A `String` that specifies the error message if validation fails.
  /// - `enableEmpty`: A `bool` that, if true, allows an empty string or null value to pass validation.
  ///
  /// Returns:
  /// A `FieldValidator<T>` that validates email addresses.
  static FieldValidator<T> email<T>(String errorMessage,
          [bool enableEmpty = false]) =>
      FieldValidator<T>(
          validate: (T? value) =>
              (enableEmpty && (value == null || value == ''))
                  ? true
                  : value is String
                      ? AppRegExp[RegExpType.email]!.hasMatch(value)
                      : false,
          errorMessage: errorMessage);

  /// Ensures a string has a minimum length.
  ///
  /// This validator checks that the string is at least `minLength` characters long.
  ///
  /// Parameters:
  /// - `minLength`: An `int` specifying the minimum number of characters required.
  /// - `errorMessage`: A `String` that specifies the error message if validation fails.
  ///
  /// Returns:
  /// A `FieldValidator<T>` that validates the minimum length of a string.
  static FieldValidator<T> minLength<T>(int minLength, String errorMessage) =>
      FieldValidator<T>(
          validate: (T? value) =>
              value is String ? value.length >= minLength : false,
          errorMessage: errorMessage);

  /// Ensures a string does not exceed a maximum length.
  ///
  /// This validator checks that the string is no longer than `maxLength` characters.
  ///
  /// Parameters:
  /// - `maxLength`: An `int` specifying the maximum number of characters allowed.
  /// - `errorMessage`: A `String` that specifies the error message if validation fails.
  ///
  /// Returns:
  /// A `FieldValidator<T>` that validates the maximum length of a string.
  static FieldValidator<T> maxLength<T>(int maxLength, String errorMessage) =>
      FieldValidator<T>(
          validate: (T? value) =>
              value is String ? value.length <= maxLength : false,
          errorMessage: errorMessage);

  /// Validates that a string contains at least one lowercase letter.
  ///
  /// This validator uses a regular expression to check for the presence of lowercase letters in the string.
  ///
  /// Parameters:
  /// - `errorMessage`: A `String` that specifies the error message if validation fails.
  ///
  /// Returns:
  /// A `FieldValidator<T>` that checks for lowercase letters in a string.
  static FieldValidator<T> containLowercase<T>(String errorMessage) =>
      FieldValidator<T>(
          validate: (T? value) => value is String
              ? AppRegExp[RegExpType.passwordContainLowercase]!.hasMatch(value)
              : false,
          errorMessage: errorMessage);

  /// Validates that a string contains at least one number.
  ///
  /// This validator uses a regular expression to check for the presence of numeric characters in the string.
  ///
  /// Parameters:
  /// - `errorMessage`: A `String` that specifies the error message if validation fails.
  ///
  /// Returns:
  /// A `FieldValidator<T>` that checks for numeric characters in a string.
  static FieldValidator<T> containNumber<T>(String errorMessage) =>
      FieldValidator<T>(
          validate: (T? value) => value is String
              ? AppRegExp[RegExpType.passwordContainNumber]!.hasMatch(value)
              : false,
          errorMessage: errorMessage);

  /// Validates that a string contains at least one uppercase letter.
  ///
  /// This validator uses a regular expression to check for the presence of uppercase letters in the string.
  ///
  /// Parameters:
  /// - `errorMessage`: A `String` that specifies the error message if validation fails.
  ///
  /// Returns:
  /// A `FieldValidator<T>` that checks for uppercase letters in a string.
  static FieldValidator<T> containUppercase<T>(String errorMessage) =>
      FieldValidator<T>(
          validate: (T? value) => value is String
              ? AppRegExp[RegExpType.passwordContainUppercase]!.hasMatch(value)
              : false,
          errorMessage: errorMessage);

  /// Validates that a string contains at least one special character.
  ///
  /// This validator uses a regular expression to ensure the presence of special characters like @, #, $, etc., in the string.
  ///
  /// Parameters:
  /// - `errorMessage`: A `String` that specifies the error message if validation fails.
  ///
  /// Returns:
  /// A `FieldValidator<T>` that checks for special characters in a string.
  static FieldValidator<T> containSpecialCharacter<T>(String errorMessage) =>
      FieldValidator<T>(
          validate: (T? value) => value is String
              ? AppRegExp[RegExpType.passwordContainSpecialCharacter]!
                  .hasMatch(value)
              : false,
          errorMessage: errorMessage);

  /// Validates that the value of one field matches the value of another specified field.
  ///
  /// This conditional validator is used for cases like verifying a confirmed password matches the original.
  ///
  /// Parameters:
  /// - `conditionalFieldKey`: A `String` identifying the key of the field to compare against.
  /// - `errorMessage`: A `String` that specifies the error message if validation fails.
  ///
  /// Returns:
  /// A `ConditionalFieldValidator<T>` that checks if two field values are the same.
  static ConditionalFieldValidator<T> sameValueAsField<T>(
          String conditionalFieldKey, String errorMessage) =>
      ConditionalFieldValidator<T>(
        conditionalFieldKey: conditionalFieldKey,
        errorMessage: errorMessage,
        validate: (value, conditionalValue) => value == conditionalValue,
      );

  /// Validates that a field contains a valid TimeOfDay in the format HH:MM.
  ///
  /// This validator checks if the input string matches the time pattern and can be parsed to a valid TimeOfDay.
  /// It can optionally allow empty values to be considered valid if `enableEmpty` is set to true.
  ///
  /// Parameters:
  /// - `errorMessage`: A `String` that specifies the error message if validation fails.
  /// - `enableEmpty`: A `bool` that, if true, allows an empty string or null value to pass validation.
  ///
  /// Returns:
  /// A `FieldValidator<T>` that validates time strings in the format HH:MM.
  static FieldValidator<T> timeOfDay<T>(String errorMessage,
          [bool enableEmpty = false]) =>
      FieldValidator<T>(
          validate: (T? value) =>
              (enableEmpty && (value == null || value == ''))
                  ? true
                  : value is String
                      ? FormParser.parseTimeOfDay(value) != null
                      : false,
          errorMessage: errorMessage);
}

class FormParser {
  /// Parses a time string in the format HH:MM to a TimeOfDay object.
  ///
  /// Returns a TimeOfDay object if the string is valid, otherwise returns null.
  static TimeOfDay? parseTimeOfDay(String timeString) {
    if (timeString.isEmpty || timeString.length != 5) {
      return null;
    }
    final parts = timeString.split(':');
    if (parts.length != 2) {
      return null;
    }
    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);
    if (hour == null || minute == null) {
      return null;
    }
    if (hour < 0 || hour > 23 || minute < 0 || minute > 59) {
      return null;
    }
    return TimeOfDay(hour: hour, minute: minute);
  }
}
