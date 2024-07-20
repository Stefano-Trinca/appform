part of 'test_form_cubit.dart';

@immutable
class TestFormState extends AppFormState<TestFormState> {
  final bool valid;
  final AppFormFieldString name;
  final AppFormFieldString email;
  final AppFormFieldString password;

  TestFormState({
    this.valid = false,
    AppFormFieldString? name,
    AppFormFieldString? email,
    AppFormFieldString? password,
    super.stateStatus,
  })  : name = name ??
            AppFormFieldString(
                key: 'name',
                value: '',
                validators: [FieldValidators.required('Write your name')]),
        email = email ??
            AppFormFieldString(key: 'email', value: '', validators: [
              FieldValidators.required('Write your name'),
              FieldValidators.sameValueAsField(
                  'name', 'La mail deve essere il nome'),
              FieldValidators.email('Write a valid email'),
            ]),
        password = password ??
            AppFormFieldString(value: '', key: 'password', validators: [
              FieldValidators.containNumber('inserisci numeri')
            ]);

  TestFormState copyWith({
    bool? valid,
    AppFormFieldString? name,
    AppFormFieldString? email,
    AppFormFieldString? password,
    StateStatus? stateStatus,
  }) {
    return TestFormState(
        valid: valid ?? this.valid,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        stateStatus: stateStatus ?? this.stateStatus);
  }

  @override
  List<Object?> get props => [valid, name, email, password];

  @override
  TestFormState copyWithFields(Map<String, dynamic> map) => copyWith(
        name: map['name'] as AppFormFieldString?,
        email: map['email'] as AppFormFieldString?,
        password: map['password'] as AppFormFieldString?,
      );

  @override
  List<AppFormFieldBase> get inputs => [name, email, password];
}
