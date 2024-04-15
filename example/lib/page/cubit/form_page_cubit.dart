import 'package:applog/applog.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../validators/formvalidator.dart';

part 'form_page_state.dart';

class FormPageCubit extends Cubit<FormPageState> {
  FormPageCubit() : super(FormPageState());

  void submit() {
    AppLog.info(
        'fileds value = \n'
            'formValid = ${state.formValid}\n'
            'name = ${state.nameField.data}\n'
            'surname = ${state.surnameField.data}\n',
        'FormPageCubit',
        'submit');
  }
}

mixin AppForm {
  List<AppFormField> get inputs;

  bool get formValid => AppFormMethods.validate(inputs);
}

class AppFormMethods {
  static bool validate(List<AppFormField> inputs) {
    return inputs.every((element) => element.validate() == null);
  }
}

//
//
//
//
//
//

class AppFormFieldString extends AppFormField<String> {
  final TextEditingController controller = TextEditingController();

  AppFormFieldString({String? text, List<FormValidator<String>>? validators})
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

abstract class AppFormField<T> extends ValueNotifier<AppFormFieldValue<T>> {
  final Key? key;
  final List<FormValidator<T>> validators;

  AppFormField({this.key, required T value, this.validators = const []})
      : super(AppFormFieldValue<T>(value: value));

  void update(T value) => super.value = super.value.copyWith(value: value);

  void clear();

  T? get data => super.value.value;

  String? get errorText => value.error;

  String? validate() {
    for (var validator in validators) {
      if (!validator.validate(super.value.value)) {
        super.value = super.value.copyWith(valid: false, error: validator.errorMessage);
        return validator.errorMessage;
      }
    }
    super.value = AppFormFieldValue(value: super.value.value);
    return null;
  }
}

class AppFormFieldValue<T> extends Equatable {
  final T value;
  final String? error;
  final bool valid;

  const AppFormFieldValue({
    required this.value,
    this.valid = false,
    this.error,
  });

  AppFormFieldValue<T> copyWith({
    T? value,
    String? error,
    bool? valid,
  }) {
    return AppFormFieldValue<T>(
      value: value ?? this.value,
      error: error ?? this.error,
      valid: valid ?? this.valid,
    );
  }

  @override
  List<Object?> get props => [value, error, valid];
}
