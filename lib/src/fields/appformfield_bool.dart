import 'package:flutter/widgets.dart';

import '../../appform.dart';

class AppFormFieldBool extends AppFormFieldBase<bool, AppFormFieldBool> {
  AppFormFieldBool.init({
    super.key,
    List<FormValidator<bool>>? validators,
    bool? value,
    TextEditingController? controller,
    String Function(bool? value)? asString,
  }) : super.init(validators: validators, value: value, controller: controller, asString: asString);

  AppFormFieldBool.dirty({
    super.key,
    List<FormValidator<bool>>? validators,
    bool? value,
    TextEditingController? controller,
    String Function(bool? value)? asString,
  }) : super.dirty(
            validators: validators, value: value, controller: controller, asString: asString);

  @override
  AppFormFieldBool update(
          [bool? value, List<FormValidator<bool>>? validators, bool? updateController]) =>
      AppFormFieldBool.dirty(
          key: key,
          value: value,
          validators: validators ?? this.validators,
          controller: updateController == true
              ? TextEditingController(text: asString?.call(value) ?? value?.toString() ?? '')
              : this.controller,
          asString: this.asString);

  @override
  AppFormFieldBool dirty(
          [bool? value, List<FormValidator<bool>>? validators, bool? updateController]) =>
      AppFormFieldBool.dirty(
          key: key,
          value: value ?? this.value,
          validators: validators ?? this.validators,
          controller: updateController == true
              ? TextEditingController(text: asString?.call(value) ?? value?.toString() ?? '')
              : this.controller,
          asString: this.asString);

  @override
  AppFormFieldBool clear() =>
      AppFormFieldBool.init(validators: this.validators, asString: this.asString);
}
