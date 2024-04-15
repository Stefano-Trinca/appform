import 'package:appform/src/state/state_status.dart';

import 'appform_field.dart';

mixin AppForm {
  List<AppFormField> get inputs;

  /// Determinate the state of the Form
  ///
  /// if valid return [StateStatus.valid]
  ///
  /// else return [StateStatus.invalid]
  StateStatus get formValid => AppFormMethods.validate(inputs);
}

class AppFormMethods {
  static StateStatus validate(List<AppFormField> inputs) {
    bool isValid = true;
    for (var e in inputs) {
      if (e.validate() != null) {
        isValid = false;
      }
    }

    return isValid ? StateStatus.valid : StateStatus.invalid;
  }
}
