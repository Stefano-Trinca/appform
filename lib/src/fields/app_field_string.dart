import 'package:appform/appform.dart';

class AppFormFieldString extends AppFormFieldBase<String, AppFormFieldString> {
  const AppFormFieldString({
    super.key,
    required super.value,
    super.error,
    super.valid,
    super.validators,
  });

  @override
  AppFormFieldString clear([String? value]) => copyWith(value: '');

  @override
  AppFormFieldString copyWith(
          {String? key,
          String? value,
          List<FieldValidatorInterface<String>>? validators,
          String? error,
          bool? valid}) =>
      AppFormFieldString(
        key: key ?? this.key,
        value: value ?? this.value,
        error: error ?? this.error,
        valid: valid ?? this.valid,
        validators: validators ?? this.validators,
      );
}
