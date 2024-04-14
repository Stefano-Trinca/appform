import 'package:equatable/equatable.dart';

import 'regexp.dart';

typedef ValidateFunction<T> = bool Function(T? value);

class FormValidator<T> extends Equatable {
  final ValidateFunction<T> validate;
  final String errorMessage;

  @override
  List<Object> get props => [validate, errorMessage];

  const FormValidator({required this.validate, required this.errorMessage});

  //region $  •••••••••••••••  Constructors •••••••••••••••

  factory FormValidator.empty(String errorMessage) => FormValidator<T>(
      validate: (T? value) =>
          value is String? ? (value != null && value.isNotEmpty) : value != null,
      errorMessage: errorMessage);

  factory FormValidator.email(String errorMessage, [bool enableEmpty = false]) => FormValidator<T>(
      validate: (T? value) => (enableEmpty && (value == null || value == ''))
          ? true
          : value is String
              ? AppRegExp[RegExpType.email]!.hasMatch(value)
              : false,
      errorMessage: errorMessage);

  factory FormValidator.minLength(int minLength, String errorMessage) => FormValidator<T>(
      validate: (T? value) => value is String ? value.length >= minLength : false,
      errorMessage: errorMessage);

  factory FormValidator.passwordContainLowercase(String errorMessage) => FormValidator<T>(
      validate: (T? value) =>
          value is String ? AppRegExp[RegExpType.passwordContainLowercase]!.hasMatch(value) : false,
      errorMessage: errorMessage);

  factory FormValidator.passwordContainNumber(String errorMessage) => FormValidator<T>(
      validate: (T? value) =>
          value is String ? AppRegExp[RegExpType.passwordContainNumber]!.hasMatch(value) : false,
      errorMessage: errorMessage);

  factory FormValidator.passwordContainUppercase(String errorMessage) => FormValidator<T>(
      validate: (T? value) =>
          value is String ? AppRegExp[RegExpType.passwordContainUppercase]!.hasMatch(value) : false,
      errorMessage: errorMessage);

  factory FormValidator.passwordContainSpecialCharacter(String errorMessage) => FormValidator<T>(
      validate: (T? value) => value is String
          ? AppRegExp[RegExpType.passwordContainSpecialCharacter]!.hasMatch(value)
          : false,
      errorMessage: errorMessage);

//endregion
}
