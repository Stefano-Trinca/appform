import 'package:appform/appform.dart';

class AppFormFieldDateTime
    extends AppFormFieldBase<DateTime?, AppFormFieldDateTime> {
  const AppFormFieldDateTime({
    super.key,
    required super.value,
    super.error,
    super.valid,
    super.validators,
  });

  @override
  AppFormFieldDateTime clear([DateTime? value]) => AppFormFieldDateTime(
        key: key,
        value: value,
        error: error,
        valid: valid,
        validators: validators,
      );

  @override
  AppFormFieldDateTime copyWith(
          {String? key,
          DateTime? value,
          List<FieldValidatorInterface<DateTime?>>? validators,
          String? error,
          bool? valid}) =>
      AppFormFieldDateTime(
        key: key ?? this.key,
        value: value ?? this.value,
        error: error ?? this.error,
        valid: valid ?? this.valid,
        validators: validators ?? this.validators,
      );
}
