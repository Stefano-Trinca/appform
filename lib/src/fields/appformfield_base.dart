import 'package:flutter/widgets.dart';
import 'package:formz/formz.dart';

import '../validators/formvalidator.dart';

///AppFormFieldBase
///
/// this is the base for the for field
///
/// contain all base function and controller
abstract class AppFormFieldBase<T, S extends AppFormFieldBase<T, S>>
    extends FormzInput<T?, String> {
  final Key? key;
  late final List<FormValidator<T>> validators;
  late final TextEditingController controller;
  late final String Function(T? value)? asString;

  AppFormFieldBase.init({
    this.key,
    List<FormValidator<T>>? validators,
    T? value,
    TextEditingController? controller,
    String Function(T? value)? asString,
  })  : validators = validators ?? <FormValidator<T>>[],
        asString = asString,
        controller = controller ??
            TextEditingController(text: asString?.call(value) ?? value?.toString() ?? ''),
        super.pure(value);

  AppFormFieldBase.dirty({
    this.key,
    List<FormValidator<T>>? validators,
    T? value,
    TextEditingController? controller,
    String Function(T? value)? asString,
  })  : validators = validators ?? <FormValidator<T>>[],
        asString = asString,
        controller = controller ??
            TextEditingController(text: asString?.call(value) ?? value?.toString() ?? ''),
        super.dirty(value);

  S update([T? value, List<FormValidator<T>>? validators, bool? updateController]);

  S dirty([T? value, List<FormValidator<T>>? validators, bool? updateController]);

  S clear();

  @override
  String? validator(T? value) {
    for (FormValidator<T> val in validators) {
      if (!val.validate(value)) {
        return val.errorMessage;
      }
    }
    return null;
  }

  String? get errorMessage => status == FormzInputStatus.invalid ? error : null;

  @override
  bool operator ==(Object other) =>
      super.value == (other as AppFormFieldBase).value &&
      validators == other.validators &&
      super.status == other.status &&
      controller.value == other.controller.value &&
      super.error == other.error;
}
