import 'package:appform/appform.dart';

class AppFormField<T> extends AppFormFieldBase<T, AppFormField<T>> {
  const AppFormField({
    super.key,
    required super.value,
    super.validators = const [],
    super.error,
    super.valid = false,
  });

  @override
  AppFormField<T> clear([T? value]) => copyWith(value: value);

  @override
  AppFormField<T> copyWith(
          {String? key,
          T? value,
          List<FieldValidatorInterface<T>>? validators,
          String? error,
          bool? valid}) =>
      AppFormField<T>(
        key: key ?? this.key,
        value: value ?? this.value,
        error: error ?? this.error,
        valid: valid ?? this.valid,
        validators: validators ?? this.validators,
      );
}
