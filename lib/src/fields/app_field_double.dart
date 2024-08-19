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

//
//
//
//
//
//
//
// WITH CONTROLLER
//
class AppFormFieldDoubleController
    extends AppFormFieldBaseTextEditingController<double,
        AppFormFieldDoubleController> {
  AppFormFieldDoubleController({
    super.key,
    super.controller,
    String Function(double)? valueToString,
    required super.value,
    super.error,
    super.valid,
    super.validators,
  }) : super(
          valueToString: valueToString ?? (a) => a.toStringAsFixed(2),
        );

  @override
  AppFormFieldDoubleController clear([double? value]) {
    controller.clear();
    if (value != null) {
      controller.text = valueToString?.call(value) ?? value.toString();
    }
    return AppFormFieldDoubleController(
      key: key,
      controller: controller,
      valueToString: valueToString,
      value: value ?? 0,
      error: error,
      valid: valid,
      validators: validators,
    );
  }

  @override
  AppFormFieldDoubleController copyWith(
          {String? key,
          double? value,
          List<FieldValidatorInterface<double>>? validators,
          String? error,
          bool? valid}) =>
      AppFormFieldDoubleController(
        key: key ?? this.key,
        value: value ?? this.value,
        error: error ?? this.error,
        valid: valid ?? this.valid,
        validators: validators ?? this.validators,
        controller: controller,
        valueToString: valueToString,
      );
}
