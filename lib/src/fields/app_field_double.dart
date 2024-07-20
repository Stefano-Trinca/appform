import 'package:appform/appform.dart';

class AppFormFieldDouble extends AppFormFieldBase<double, AppFormFieldDouble> {
  const AppFormFieldDouble({
    super.key,
    required super.value,
    super.error,
    super.valid,
    super.validators,
  });

  @override
  AppFormFieldDouble clear([double? value]) => AppFormFieldDouble(
        key: key,
        value: value ?? 0,
        error: error,
        valid: valid,
        validators: validators,
      );

  @override
  AppFormFieldDouble copyWith(
          {String? key,
          double? value,
          List<FieldValidatorInterface<double>>? validators,
          String? error,
          bool? valid}) =>
      AppFormFieldDouble(
        key: key ?? this.key,
        value: value ?? this.value,
        error: error ?? this.error,
        valid: valid ?? this.valid,
        validators: validators ?? this.validators,
      );
}
