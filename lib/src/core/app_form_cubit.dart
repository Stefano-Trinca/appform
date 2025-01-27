import 'package:flutter_bloc/flutter_bloc.dart';

import '../status/export.dart';
import 'app_form_field_base.dart';
import 'app_form_state.dart';

mixin AppFormCubit<State extends AppFormState<State>> on Cubit<State> {
  /// Update one or more fields
  ///
  /// use a list (key,value) for update fields
  void fieldsUpdate(List<(String, dynamic)> keyvalues) {
    Map<String, dynamic> map = {};
    for (var entry in keyvalues) {
      map[entry.$1] = map[entry.$2];
    }
    emit(state.copyWithFields(map));
  }

  /// Update one field
  ///
  /// use the key of the field to update
  ///
  /// value is the new value of the field
  void fieldUpdate(String key, dynamic value) {
    emit(state.copyWithFields({
      key: state.getAppFormField(key)?.update(value),
    }));
  }

  /// Clear one field
  ///
  /// use the key of the field to clear
  ///
  /// if value is provided, the field will be updated with the value
  void fieldClear(String key, [dynamic value]) {
    emit(state.copyWithFields({key: state.getAppFormField(key)?.clear(value)}));
  }

  void fieldClearAll() {
    Map<String, dynamic> map = {};
    for (var field in state.inputs) {
      final newField = field.clear();
      map[field.key] = newField;
    }
    emit(state.copyWithFields(map));
  }

  /// Validate one or more fields
  ///
  /// use a list of fields to validate
  ///
  /// returns StateStatus.valid if all fields are valid
  StateStatus validateFields(
      List<AppFormFieldBase<dynamic, AppFormFieldBase<dynamic, dynamic>>>
          fields) {
    Map<String, dynamic> map = {};
    bool valid = true;
    for (var field in fields) {
      final newField = field.validate(state.inputs);
      if (!newField.valid) {
        valid = false;
      }
      map[field.key] = newField;
    }
    emit(state.copyWithFields(map));
    return valid ? StateStatus.valid : StateStatus.invalid;
  }

  /// Validate all fields of the form
  ///
  /// returns StateStatus.valid if all fields are valid
  StateStatus validateForm() {
    Map<String, dynamic> map = {};
    bool valid = true;
    for (var field in state.inputs) {
      final newField = field.validate(state.inputs);
      if (!newField.valid) {
        valid = false;
      }
      map[field.key] = newField;
    }
    emit(state.copyWithFields(map));
    return valid ? StateStatus.valid : StateStatus.invalid;
  }
}
