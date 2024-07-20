import 'package:equatable/equatable.dart';

import 'app_form_field_base.dart';
import '../status/state_status.dart';

abstract class AppFormState<State extends AppFormState<State>>
    extends Equatable {
  final StateStatus stateStatus;

  const AppFormState({
    this.stateStatus = StateStatus.pure,
  });

  List<AppFormFieldBase> get inputs;

  State copyWithFields(Map<String, dynamic> map);

  AppFormFieldBase? getAppFormField(String key) {
    int idx = inputs.indexWhere((e) => e.key == key);
    if (idx == -1) return null;
    return inputs[idx];
  }
}
