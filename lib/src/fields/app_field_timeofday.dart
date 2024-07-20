import 'package:appform/appform.dart';
import 'package:flutter/material.dart';

class AppFormFieldTimeOfDay
    extends AppFormFieldBase<TimeOfDay?, AppFormFieldTimeOfDay> {
  const AppFormFieldTimeOfDay({
    super.key,
    required super.value,
    super.error,
    super.valid,
    super.validators,
  });

  @override
  AppFormFieldTimeOfDay clear([TimeOfDay? value]) => AppFormFieldTimeOfDay(
        key: key,
        value: value,
        error: error,
        valid: valid,
        validators: validators,
      );

  @override
  AppFormFieldTimeOfDay copyWith(
          {String? key,
          TimeOfDay? value,
          List<FieldValidatorInterface<TimeOfDay?>>? validators,
          String? error,
          bool? valid}) =>
      AppFormFieldTimeOfDay(
        key: key ?? this.key,
        value: value ?? this.value,
        error: error ?? this.error,
        valid: valid ?? this.valid,
        validators: validators ?? this.validators,
      );
}
