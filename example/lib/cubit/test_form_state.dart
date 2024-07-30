part of 'test_form_cubit.dart';

@immutable
class TestFormState extends AppFormState<TestFormState> {
  final bool valid;
  final AppFormFieldString name;
  final AppFormFieldString email;
  final AppFormFieldString password;
  final AppFormFieldDateTime fieldDate;
  final AppFormFieldTimeOfDay fieldTime;

  TestFormState({
    this.valid = false,
    AppFormFieldString? name,
    AppFormFieldString? email,
    AppFormFieldString? password,
    AppFormFieldDateTime? fieldDate,
    AppFormFieldTimeOfDay? fieldTime,
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
                  'name', 'Email must be the same as name'),
              FieldValidators.email('Write a valid email'),
            ]),
        password = password ??
            AppFormFieldString(value: '', key: 'password', validators: [
              FieldValidators.containNumber('Add at least one number')
            ]),
        fieldDate = fieldDate ??
            const AppFormFieldDateTime(
              key: 'date',
              value: null,
            ),
        fieldTime = fieldTime ??
            const AppFormFieldTimeOfDay(
              key: 'time',
              value: null,
            );

  TestFormState copyWith({
    bool? valid,
    AppFormFieldString? name,
    AppFormFieldString? email,
    AppFormFieldString? password,
    AppFormFieldDateTime? fieldDate,
    AppFormFieldTimeOfDay? fieldTime,
    StateStatus? stateStatus,
  }) {
    return TestFormState(
        valid: valid ?? this.valid,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        fieldDate: fieldDate ?? this.fieldDate,
        fieldTime: fieldTime ?? this.fieldTime,
        stateStatus: stateStatus ?? this.stateStatus);
  }

  @override
  List<Object?> get props =>
      [valid, name, email, password, fieldDate, fieldTime];

  @override
  TestFormState copyWithFields(Map<String, dynamic> map) => copyWith(
        name: map['name'] as AppFormFieldString?,
        email: map['email'] as AppFormFieldString?,
        password: map['password'] as AppFormFieldString?,
        fieldDate: map['date'] as AppFormFieldDateTime?,
        fieldTime: map['time'] as AppFormFieldTimeOfDay?,
      );

  @override
  List<AppFormFieldBase> get inputs =>
      [name, email, password, fieldDate, fieldTime];
}
