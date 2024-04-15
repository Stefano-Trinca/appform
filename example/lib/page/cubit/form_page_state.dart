part of 'form_page_cubit.dart';

@immutable
class FormPageState extends Equatable with AppForm {
  final StateStatus stateStatus;
  final AppFormFieldString nameField;
  final AppFormFieldString surnameField;

  FormPageState({
    this.stateStatus = StateStatus.pure,
    AppFormFieldString? nameField,
    AppFormFieldString? surnameField,
  })  : nameField = nameField ??
            AppFormFieldString(validators: [
              FormValidator.empty('Inserisci Nome'),
            ]),
        surnameField = surnameField ??
            AppFormFieldString(validators: [
              FormValidator.empty('Inserisci Cognome'),
            ]);

  @override
  List<Object> get props => [stateStatus, nameField, surnameField];

  @override
  List<AppFormField> get inputs => [nameField, surnameField];

  FormPageState copyWith({
    StateStatus? stateStatus,
    AppFormFieldString? nameField,
    AppFormFieldString? surnameField,
  }) {
    return FormPageState(
      stateStatus: stateStatus ?? this.stateStatus,
      nameField: nameField ?? this.nameField,
      surnameField: surnameField ?? this.surnameField,
    );
  }
}
