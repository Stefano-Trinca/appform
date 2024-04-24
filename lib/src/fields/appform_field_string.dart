import 'package:flutter/material.dart';

import '../core/appform_field_base.dart';
import '../validators/formvalidator.dart';

class AppFormFieldString extends AppFormFieldBase<String> {
  final TextEditingController controller = TextEditingController();

  AppFormFieldString({
    super.key,
    String? text, List<FormValidator<String>>? validators})
      : super(value: text ?? '', validators: validators ?? []) {
    controller.text = text ?? '';
    controller.addListener(_updateValue);
  }

  void _updateValue() {
    super.update(controller.text);
  }

  @override
  void dispose() {
    controller.removeListener(_updateValue);
    super.dispose();
  }

  @override
  void clear() {
    controller.clear();
    super.update('');
  }
}
