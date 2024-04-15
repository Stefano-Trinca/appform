import 'package:appform/src/state/state_status.dart';
import 'package:flutter/widgets.dart';

import '../core/appform_core.dart';
import '../validators/formvalidator.dart';

///AppFormFieldBase
///
/// this is the base for the for field
///
/// contain all base function and controller
abstract class AppFormFieldCore<T, S extends AppFormFieldCore<T, S>>
    extends AppFormInstance<T?, String> {
  final Key? key;
  late final List<FormValidator<T>> validators;
  late final TextEditingController controller;
  late final String Function(T? value)? asString;

  AppFormFieldCore.init({
    this.key,
    List<FormValidator<T>>? validators,
    T? value,
    TextEditingController? controller,
    this.asString,
  })  : validators = validators ?? <FormValidator<T>>[],
        controller = controller ??
            TextEditingController(text: asString?.call(value) ?? value?.toString() ?? ''),
        super.pure(value);

  AppFormFieldCore.dirty({
    this.key,
    List<FormValidator<T>>? validators,
    T? value,
    TextEditingController? controller,
    this.asString,
  })  : validators = validators ?? <FormValidator<T>>[],
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

  String? get errorMessage => status.isInvalid ? error : null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is AppFormFieldCore &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          validators == other.validators &&
          controller == other.controller &&
          asString == other.asString;

  @override
  int get hashCode =>
      super.hashCode ^ key.hashCode ^ validators.hashCode ^ controller.hashCode ^ asString.hashCode;
}
