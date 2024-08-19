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

//
//
//
//
//
//
//
// WITH CONTROLLER
//
class AppFormFieldIntController extends AppFormFieldBaseTextEditingController<
    int, AppFormFieldIntController> {
  AppFormFieldIntController({
    super.key,
    super.controller,
    String Function(int)? valueToString,
    required super.value,
    super.error,
    super.valid,
    super.validators,
  }) : super(
          valueToString: valueToString ?? (a) => a.toString(),
        );

  @override
  AppFormFieldIntController clear([int? value]) {
    controller.clear();
    if (value != null) {
      controller.text = valueToString?.call(value) ?? value.toString();
    }
    return AppFormFieldIntController(
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
  AppFormFieldIntController copyWith(
          {String? key,
          int? value,
          List<FieldValidatorInterface<int>>? validators,
          String? error,
          bool? valid}) =>
      AppFormFieldIntController(
        key: key ?? this.key,
        value: value ?? this.value,
        error: error ?? this.error,
        valid: valid ?? this.valid,
        validators: validators ?? this.validators,
        controller: controller,
        valueToString: valueToString,
      );
}
