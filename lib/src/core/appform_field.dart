import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../validators/formvalidator.dart';

abstract class AppFormField<T> extends ValueNotifier<AppFormFieldValue<T>> {
  final Key? key;
  final List<FormValidator<T>> validators;

  AppFormField({this.key, required T value, this.validators = const []})
      : super(AppFormFieldValue<T>(value: value));

  void set(T value) => AppFormFieldValue<T>(value: value, valid: super.value.valid, error: super.value.error);

  void update(T value) => super.value = super.value.copyWith(value: value);

  void clear();

  T? get data => super.value.value;

  String? get errorText => value.error;

  String? validate() {
    for (var validator in validators) {
      if (!validator.validate(super.value.value)) {
        super.value = super.value.copyWith(valid: false, error: validator.errorMessage);
        return validator.errorMessage;
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
