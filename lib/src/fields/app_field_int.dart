import 'package:appform/appform.dart';

class AppFormFieldInt extends AppFormFieldBase<int, AppFormFieldInt> {
  const AppFormFieldInt({
    super.key,
    required super.value,
    super.error,
    super.valid,
    super.validators,
  });

  @override
  AppFormFieldInt clear([int? value]) => AppFormFieldInt(
        key: key,
        value: value ?? 0,
        error: error,
        valid: valid,
        validators: validators,
      );

  @override
  AppFormFieldInt copyWith(
          {String? key,
          int? value,
          List<FieldValidatorInterface<int>>? validators,
          String? error,
          bool? valid}) =>
      AppFormFieldInt(
        key: key ?? this.key,
        value: value ?? this.value,
        error: error ?? this.error,
        valid: valid ?? this.valid,
        validators: validators ?? this.validators,
      );
}
