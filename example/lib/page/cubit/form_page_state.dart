part of 'form_page_cubit.dart';

@immutable
class FormPageState extends Equatable with AppForm {
  final bool state;
  final AppFormFieldString nameField;
  final AppFormFieldString surnameField;

  FormPageState({
    this.state = false,
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

  FormPageState copyWith({
    bool? state,
    AppFormFieldString? nameField,
    AppFormFieldString? surnameField,
  }) {
    return FormPageState(
      state: state ?? this.state,
      nameField: nameField ?? this.nameField,
      surnameField: surnameField ?? this.surnameField,
    );
  }

  @override
  List<Object> get props => [state, nameField, surnameField];

  @override
  List<AppFormField> get inputs => [nameField, surnameField];
}
