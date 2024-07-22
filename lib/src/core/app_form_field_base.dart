import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

import '../validators/formvalidator.dart';

abstract class AppFormFieldBaseTextEditingController<T,
        S extends AppFormFieldBaseTextEditingController<T, S>>
    extends AppFormFieldBase<T, S> {
  final TextEditingController controller;
  final String Function(T value)? valueToString;
  AppFormFieldBaseTextEditingController({
    super.key,
    TextEditingController? controller,
    this.valueToString,
    required super.value,
    super.validators = const [],
    super.error,
    super.valid = false,
  }) : controller = controller ??
            TextEditingController(
                text: value == null
                    ? ''
                    : valueToString?.call(value) ?? value.toString());
}

abstract class AppFormFieldBase<T, S extends AppFormFieldBase<T, S>>
    extends AppFormFieldInterface<T, S> {
  const AppFormFieldBase({
    super.key,
    required super.value,
    super.validators = const [],
    super.error,
    super.valid = false,
  });

  @override
  S copyWith(
      {String? key,
      T? value,
      List<FieldValidatorInterface<T>>? validators,
      String? error,
      bool? valid});

  @override
  S update(T value, [bool validate = false]) {
    final S updatedAppFormField = copyWith(value: value);

    if (validate) {
      return updatedAppFormField.validate();
    } else {
      return updatedAppFormField;
    }
  }

  @override
  S clear([T? value]);

  @override
  S validate([List<AppFormFieldInterface> fields = const []]) {
    if (hasConditionalValidators && fields.isEmpty) {
      return copyWith(
        error: 'Conditional Validation Error',
        valid: false,
      );
    } else {
      String? errorMessage;
      bool? valid = true;
      for (var validator in validators) {
        if (validator is ConditionalFieldValidator<T>) {
          // conditional validator
          final idx = fields
              .indexWhere((f) => f.key == (validator).conditionalFieldKey);
          if (idx == -1) {
            errorMessage = 'Validation not possible - field not found';
            valid = false;
            break;
          } else {
            if (!(validator).validate(super.value, fields[idx].value)) {
              errorMessage = validator.errorMessage;
              valid = false;
              break;
            }
          }
        } else {
          // default validator
          if (!(validator as FieldValidator<T>).validate(super.value)) {
            errorMessage = validator.errorMessage;
            valid = false;
            break;
          }
        }
      }
      return copyWith(
        valid: valid,
        error: errorMessage ?? '',
      );
    }
  }
}

abstract class AppFormFieldInterface<T, S extends AppFormFieldInterface<T, S>>
    extends Equatable {
  final String key;
  final T value;
  final List<FieldValidatorInterface<T>> validators;
  final String _error;
  final bool valid;

  const AppFormFieldInterface({
    this.key = '',
    required this.value,
    this.validators = const [],
    String? error,
    this.valid = false,
  }) : _error = error ?? '';

  S copyWith({
    String? key,
    T? value,
    List<FieldValidatorInterface<T>>? validators,
    String? error,
    bool? valid,
  });
  S update(
    T value, [
    bool validate = false,
  ]);
  S clear([T? value]);

  S validate([List<AppFormFieldInterface> fields = const []]);

  String? get error => _error.isEmpty ? null : _error;

  /// Check if there are some [ConditionalFieldValidator] in the [validators] list
  bool get hasConditionalValidators =>
      validators.isNotEmpty &&
      validators.any((v) => v is ConditionalFieldValidator);

  @override
  List<Object?> get props => [key, value, validators, _error, valid];
}
