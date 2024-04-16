import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../validators/formvalidator.dart';

abstract class AppFormField<T> extends ValueNotifier<AppFormFieldValue<T>> {
  final String? key;
  final List<FormValidator<T>> validators;

  AppFormField({this.key, required T value, this.validators = const []})
      : super(AppFormFieldValue<T>(value: value));

  void set(T value) =>
      AppFormFieldValue<T>(value: value, valid: super.value.valid, error: super.value.error);

  void update(T value) => super.value = super.value.copyWith(value: value);

  void clear();

  T? get data => super.value.value;

  String? get errorText => value.error;

  /// Check if there are some [ConditionalFieldValidator] in the [validators] list
  bool get hasConditionalValidators =>
      validators.isNotEmpty && validators.any((v) => v is ConditionalFieldValidator);

  String? validate([List<AppFormField> fields = const []]) {
    if (hasConditionalValidators && fields.isEmpty) {
      super.value =
          super.value.copyWith(valid: false, error: 'Validation not possible - fields empty');
      return 'Conditional Error';
    } else {
      for (var validator in validators) {
        if (validator is ConditionalFieldValidator<T>) {
          // conditional validator
          final idx = fields.indexWhere((f) => f.key == (validator).conditionalFieldKey);
          if (idx == -1) {
            super.value = super
                .value
                .copyWith(valid: false, error: 'Validation not possible - field not found');
            return 'Conditional Error';
          } else {
            if (!(validator).validate(super.value.value, fields[idx].value.value)) {
              super.value = super.value.copyWith(valid: false, error: validator.errorMessage);
              return validator.errorMessage;
            }
          }
        } else {
          // default validator
          if (!(validator as FieldValidator<T>).validate(super.value.value)) {
            super.value = super.value.copyWith(valid: false, error: validator.errorMessage);
            return validator.errorMessage;
          }
        }
      }
    }
    super.value = AppFormFieldValue<T>(value: super.value.value, valid: true);
    return null;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppFormField &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          validators == other.validators;

  @override
  int get hashCode => key.hashCode ^ validators.hashCode;
}

class AppFormFieldValue<T> extends Equatable {
  final T value;
  final String? error;
  final bool valid;

  const AppFormFieldValue({
    required this.value,
    this.valid = false,
    this.error,
  });

  AppFormFieldValue<T> copyWith({
    T? value,
    String? error,
    bool? valid,
  }) {
    return AppFormFieldValue<T>(
      value: value ?? this.value,
      error: error ?? this.error,
      valid: valid ?? this.valid,
    );
  }

  @override
  List<Object?> get props => [value, error, valid];
}
