import 'package:flutter/material.dart';

import '../../appform.dart';

///App form Field for datetime
class AppFormFieldTime extends AppFormFieldBase<TimeOfDay, AppFormFieldTime> {
  AppFormFieldTime.init({
    super.key,
    List<FormValidator<TimeOfDay>>? validators,
    TimeOfDay? value,
    TextEditingController? controller,
    String Function(TimeOfDay? value)? asString,
  }) : super.init(
          validators: validators,
          value: value,
          controller: controller,
          asString: asString ?? (time) => time?.asString() ?? '',
        );

  AppFormFieldTime.dirty({
    super.key,
    List<FormValidator<TimeOfDay>>? validators,
    TimeOfDay? value,
    TextEditingController? controller,
    String Function(TimeOfDay? value)? asString,
  }) : super.dirty(
          validators: validators,
          value: value,
          controller: controller,
          asString: asString ?? (time) => time?.asString() ?? '',
        );

  @override
  AppFormFieldTime update(
          [TimeOfDay? value, List<FormValidator<TimeOfDay>>? validators, bool? updateController]) =>
      AppFormFieldTime.dirty(
          key: key,
          value: value,
          validators: validators ?? this.validators,
          controller: updateController == true
              ? TextEditingController(text: asString?.call(value) ?? value?.toString() ?? '')
              : this.controller,
          asString: this.asString);

  @override
  AppFormFieldTime dirty(
          [TimeOfDay? value, List<FormValidator<TimeOfDay>>? validators, bool? updateController]) =>
      AppFormFieldTime.dirty(
          key: key,
          value: value ?? this.value,
          validators: validators ?? this.validators,
          controller: updateController == true
              ? TextEditingController(text: asString?.call(value) ?? value?.toString() ?? '')
              : this.controller,
          asString: this.asString);

  @override
  AppFormFieldTime clear() => AppFormFieldTime.init(validators: this.validators);
}

extension on TimeOfDay {
  String asString() => '${hour.stringDouble}:${minute.stringDouble}';
}

extension on int {
  String get stringDouble => this > 9 ? '$this' : '0$this';
}
