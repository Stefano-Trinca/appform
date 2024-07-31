import 'package:appform/appform.dart';

class AppFormFieldBool extends AppFormFieldBase<bool, AppFormFieldBool> {
  const AppFormFieldBool({
    super.key,
    required super.value,
    super.error,
    super.valid,
    super.validators,
  });

  @override
  AppFormFieldBool clear([bool? value]) => AppFormFieldBool(
        key: key,
        value: value ?? false,
        error: error,
        valid: valid,
        validators: validators,
      );

  @override
  AppFormFieldBool copyWith(
          {String? key,
          bool? value,
          List<FieldValidatorInterface<bool>>? validators,
          String? error,
          bool? valid}) =>
      AppFormFieldBool(
        key: key ?? this.key,
        value: value ?? this.value,
        error: error ?? this.error,
        valid: valid ?? this.valid,
        validators: validators ?? this.validators,
      );
}
