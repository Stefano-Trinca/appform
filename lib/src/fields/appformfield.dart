import 'package:flutter/widgets.dart';

import '../../appform.dart';

class AppFormField<T> extends AppFormFieldBase<T, AppFormField<T>> {
  AppFormField.init({
    super.key,
    List<FormValidator<T>>? validators,
    T? value,
    TextEditingController? controller,
    String Function(T? value)? asString,
  }) : super.init(validators: validators, value: value, controller: controller, asString: asString);

  AppFormField.dirty({
    super.key,
    List<FormValidator<T>>? validators,
    T? value,
    TextEditingController? controller,
    String Function(T? value)? asString,
  }) : super.dirty(
            validators: validators, value: value, controller: controller, asString: asString);

  @override
  AppFormField<T> update([T? value, List<FormValidator<T>>? validators, bool? updateController]) =>
      AppFormField<T>.dirty(
          key: this.key,
          value: value,
          validators: validators ?? this.validators,
          controller: updateController == true
              ? TextEditingController(text: asString?.call(value) ?? value?.toString() ?? '')
              : this.controller,
          asString: this.asString);

  @override
  AppFormField<T> dirty([T? value, List<FormValidator<T>>? validators, bool? updateController]) =>
      AppFormField<T>.dirty(
          key: this.key,
          value: value ?? this.value,
          validators: validators ?? this.validators,
          controller: updateController == true
              ? TextEditingController(text: asString?.call(value) ?? value?.toString() ?? '')
              : this.controller,
          asString: this.asString);

  @override
  AppFormField<T> clear() =>
      AppFormField<T>.init(key: this.key, validators: this.validators, asString: this.asString);
}
