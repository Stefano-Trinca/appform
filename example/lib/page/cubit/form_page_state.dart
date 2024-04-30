part of 'form_page_cubit.dart';

@immutable
class FormPageState extends Equatable with AppForm {
  final StateStatus stateStatus;
  final AppFormFieldString nameField;
  final AppFormFieldString surnameField;
  final AppFormFieldString surnameCompareField;
  final AppFormFieldDateTime dateField;
  final AppFormFieldTimeOfDay timeField;
  final AppFormField<FormStateEnum> stateField;

  FormPageState({
    this.stateStatus = StateStatus.pure,
    AppFormFieldString? nameField,
    AppFormFieldString? surnameField,
    AppFormFieldString? surnameCompareField,
    AppFormFieldDateTime? dateField,
    AppFormFieldTimeOfDay? timeField,
    AppFormField<FormStateEnum>? stateField,
  })  : nameField = nameField ??
            AppFormFieldString(validators: [
              FormValidators.required('Inserisci Nome'),
            ]),
        surnameField = surnameField ??
            AppFormFieldString(key: 'surname', validators: [
              FormValidators.required('Inserisci Cognome'),
            ]),
        surnameCompareField = surnameCompareField ??
            AppFormFieldString(validators: [
              FormValidators.sameValueAsField('surname', 'Cognomi differenti'),
            ]),
        stateField = stateField ?? AppFormField<FormStateEnum>(),
        timeField = timeField ?? AppFormFieldTimeOfDay(),
        dateField = dateField ?? AppFormFieldDateTime(initialValueNow: true, validators: []);

  @override
  List<Object> get props =>
      [stateStatus, nameField, surnameField, surnameCompareField, dateField, timeField,stateField];

  @override
  List<AppFormFieldBase> get inputs =>
      [nameField, surnameField, surnameCompareField, dateField, timeField, stateField];

  FormPageState copyWith({
    StateStatus? stateStatus,
    AppFormFieldString? nameField,
    AppFormFieldString? surnameField,
    AppFormFieldString? surnameCompareField,
    AppFormFieldDateTime? dateField,
    AppFormFieldTimeOfDay? timeField,
    AppFormField<FormStateEnum>? stateField,
  }) {
    return FormPageState(
      stateStatus: stateStatus ?? this.stateStatus,
      nameField: nameField ?? this.nameField,
      surnameField: surnameField ?? this.surnameField,
      surnameCompareField: surnameCompareField ?? this.surnameCompareField,
      dateField: dateField ?? this.dateField,
      stateField: stateField ?? this.stateField,
      timeField: timeField ?? this.timeField,
    );
  }
}

enum FormStateEnum {
  bad,
  none,
  good;


}
