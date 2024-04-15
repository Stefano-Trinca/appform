import 'package:appform/appform.dart';
import 'package:applog/applog.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'form_page_state.dart';

class FormPageCubit extends Cubit<FormPageState> {
  FormPageCubit() : super(FormPageState());

  void submit() {
    if (state.formValid.isInvalid) {
      emit(state.copyWith(stateStatus: StateStatus.submissionFailure));
    } else {
      emit(state.copyWith(stateStatus: StateStatus.submissionSuccess));
    }
    AppLog.info(
        'fileds value = \n'
            'formValid = ${state.formValid}\n'
            'name = ${state.nameField.data}\n'
            'surname = ${state.surnameField.data}\n',
        'FormPageCubit',
        'submit');
  }
}
