import 'package:appform/appform.dart';
import 'package:flutter/material.dart';

class AppFormFieldTimeOfDay extends AppFormField<TimeOfDay?> {
  AppFormFieldTimeOfDay({
    super.key,
    TimeOfDay? time,
    List<FormValidator<TimeOfDay>>? validators,
    bool initialValueNow = false,
  }) : super(
            value: time ?? (initialValueNow ? TimeOfDay.now() : null),
            validators: validators ?? []);

  @override
  void clear() {
    super.set(null);
  }
}
