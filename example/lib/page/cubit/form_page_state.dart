part of 'form_page_cubit.dart';

@immutable
class FormPageState extends Equatable with AppForm {
  final StateStatus stateStatus;
  final AppFormFieldString nameField;
  final AppFormFieldString surnameField;
  final AppFormFieldString surnameCompareField;

  FormPageState({
    this.stateStatus = StateStatus.pure,
    AppFormFieldString? nameField,
    AppFormFieldString? surnameField,
    AppFormFieldString? surnameCompareField,
  })  : nameField = nameField ??
            AppFormFieldString(validators: [
              FormValidators.required('Inserisci Nome'),
            ]),
        surnameField = surnameField ??
            AppFormFieldString(
                key: 'surname',
                validators: [
              FormValidators.required('Inserisci Cognome'),
            ]),
        surnameCompareField = surnameCompareField ??
            AppFormFieldString(validators: [
              FormValidators.sameValueAsField('surname', 'Cognomi differenti'),
            ]);

  @override
  List<Object> get props => [stateStatus, nameField, surnameField, surnameCompareField];

  @override
  List<AppFormField> get inputs => [nameField, surnameField, surnameCompareField];

  FormPageState copyWith({
    StateStatus? stateStatus,
    AppFormFieldString? nameField,
    AppFormFieldString? surnameField,
    AppFormFieldString? surnameCompareField,
  }) {
    return FormPageState(
      stateStatus: stateStatus ?? this.stateStatus,
      nameField: nameField ?? this.nameField,
      surnameField: surnameField ?? this.surnameField,
      surnameCompareField: surnameCompareField ?? this.surnameCompareField,
    );
  }
}
