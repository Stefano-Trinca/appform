import 'package:flutter_bloc/flutter_bloc.dart';

import '../status/export.dart';
import 'app_form_state.dart';

mixin AppFormCubit<State extends AppFormState<State>> on Cubit<State> {
  void fieldUpdate(String key, dynamic value) {
    emit(state.copyWithFields({
      key: state.getAppFormField(key)?.update(value),
    }));
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
