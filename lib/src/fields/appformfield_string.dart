import 'package:flutter/widgets.dart';

import '../../appform.dart';

class AppFormFieldString extends AppFormFieldBase<String, AppFormFieldString> {
  AppFormFieldString.init({
    super.key,
    List<FormValidator<String>>? validators,
    String? value,
    TextEditingController? controller,
    String Function(String? value)? asString,
  }) : super.init(validators: validators, value: value, controller: controller, asString: asString);

  AppFormFieldString.dirty({
    super.key,
    List<FormValidator<String>>? validators,
    String? value,
    TextEditingController? controller,
    String Function(String? value)? asString,
  }) : super.dirty(
            validators: validators, value: value, controller: controller, asString: asString);

  @override
  AppFormFieldString update(
          [String? value, List<FormValidator<String>>? validators, bool? updateController]) =>
      AppFormFieldString.dirty(
        key: key,
        value: value,
        validators: validators ?? this.validators,
        controller: updateController == true
            ? TextEditingController(text: asString?.call(value) ?? value?.toString() ?? '')
            : this.controller,
        asString: this.asString,
      );

  @override
  AppFormFieldString dirty(
          [String? value, List<FormValidator<String>>? validators, bool? updateController]) =>
      AppFormFieldString.dirty(
        key: key,
        value: value ?? this.value,
        validators: validators ?? this.validators,
        controller: updateController == true
            ? TextEditingController(text: asString?.call(value) ?? value?.toString() ?? '')
            : this.controller,
        asString: this.asString,
      );

  @override
  AppFormFieldString clear() =>
      AppFormFieldString.init(validators: this.validators, asString: this.asString);
}
