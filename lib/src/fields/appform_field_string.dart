import 'package:flutter/material.dart';

import '../core/appform_field_base.dart';
import '../validators/formvalidator.dart';

class AppFormFieldString extends AppFormFieldBase<String> {
  late final TextEditingController controller;
  final bool validateOnChange;

  AppFormFieldString({
    super.key,
    String? text,
    List<FormValidator<String>>? validators,
    this.validateOnChange = false,
    TextEditingController? controller,
  }) : super(value: text ?? '', validators: validators ?? []) {
    this.controller = controller ?? TextEditingController();
    this.controller.text = text ?? '';
    this.controller.addListener(_updateValue);
  }

  void _updateValue() {
    super.update(controller.text, validateOnChange);
  }

  @override
  void dispose() {
    controller.removeListener(_updateValue);
    super.dispose();
  }

  @override
  void clear() {
    controller.clear();
    super.update('', validateOnChange);
  }
}
