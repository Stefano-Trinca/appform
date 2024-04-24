import 'package:appform/src/state/state_status.dart';

import 'appform_field_base.dart';

mixin AppForm {
  List<AppFormFieldBase> get inputs;

  /// Determinate the state of the Form
  ///
  /// if valid return [StateStatus.valid]
  ///
  /// else return [StateStatus.invalid]
  StateStatus get formValid => AppFormMethods.validate(inputs);
}

class AppFormMethods {
  static StateStatus validate(List<AppFormFieldBase> inputs) {
    bool isValid = true;
    for (var e in inputs) {
      if (e.validate(inputs) != null) {
        isValid = false;
      }
    }

    return isValid ? StateStatus.valid : StateStatus.invalid;
  }
}
