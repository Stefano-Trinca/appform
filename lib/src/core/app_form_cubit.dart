import 'package:flutter_bloc/flutter_bloc.dart';

import '../status/export.dart';
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

  void fieldUpdate(String key, dynamic value) {
    emit(state.copyWithFields({
      key: state.getAppFormField(key)?.update(value),
    }));
  }

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
