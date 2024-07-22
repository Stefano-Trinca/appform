
# appform

## Description

`appform` is a Flutter package designed to simplify the creation of forms using `flutter_bloc`, specifically `Cubit`. This package helps manage form fields and validation in a structured and efficient way.

## Features

- Provides various form field types such as `AppFormFieldString`, `AppFormFieldInt`, `AppFormFieldDouble`, `AppFormFieldDateTime`, and `AppFormFieldTimeOfDay`.
- Utilizes `AppFormCubit` for state management and form validation.
- Easy integration with `flutter_bloc`.

## Installation

Add `appform` to your `pubspec.yaml`:

```yaml
appform:
  git:
    url: https://github.com/Stefano-Trinca/appform.git
    ref: 0.2.4
```

Then, run `flutter pub get` to install the package.

## Usage

### Step 1: Create a Form State with Fields

Create a state class that extends `AppFormState` and defines the form fields:

```dart
import 'package:appform/appform.dart';

@immutable
class TestFormState extends AppFormState<TestFormState> {
  final AppFormFieldString name;
  final AppFormFieldString email;
  final AppFormFieldString password;

  TestFormState({
    AppFormFieldString? name,
    AppFormFieldString? email,
    AppFormFieldString? password,
    super.stateStatus,
  })  : name = name ?? AppFormFieldString(key: 'name', value: '', validators: [FieldValidators.required('Name is required')]),
        email = email ?? AppFormFieldString(key: 'email', value: '', validators: [FieldValidators.required('Email is required'), FieldValidators.email('Invalid email')]),
        password = password ?? AppFormFieldString(key: 'password', value: '', validators: [FieldValidators.required('Password is required')]);

  @override
  List<Object?> get props => [name, email, password];

  @override
  TestFormState copyWithFields(Map<String, dynamic> map) => copyWith(
        name: map['name'] as AppFormFieldString?,
        email: map['email'] as AppFormFieldString?,
        password: map['password'] as AppFormFieldString?,
      );

  @override
  List<AppFormFieldBase> get inputs => [name, email, password];
}
```

### Step 2: Create a Cubit for the Form

Create a Cubit that extends `AppFormCubit` and uses the form state:

```dart
import 'package:appform/appform.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestFormCubit extends Cubit<TestFormState> with AppFormCubit {
  TestFormCubit() : super(TestFormState());
}
```

### Step 3: Build the Form UI

Use `BlocProvider` to provide the `TestFormCubit` to the widget tree and build the form using `BlocBuilder`:

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appform/appform.dart';

class TestForm extends StatelessWidget {
  const TestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestFormCubit(),
      child: const _FormFields(),
    );
  }
}

class _FormFields extends StatelessWidget {
  const _FormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FieldName(),
        FieldEmail(),
        FieldPassword(),
        SizedBox(height: 24),
        ValidateButton(),
      ],
    );
  }
}

class FieldName extends StatelessWidget {
  const FieldName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestFormCubit, TestFormState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextFormField(
          initialValue: state.name.value,
          decoration: InputDecoration(
            hintText: 'Name',
            errorText: state.name.error,
          ),
          onChanged: (value) => context.read<TestFormCubit>().fieldUpdate(state.name.key, value),
        );
      },
    );
  }
}

// Similarly, define FieldEmail and FieldPassword components

class ValidateButton extends StatelessWidget {
  const ValidateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<TestFormCubit>().validateForm(),
      child: Text('Validate'),
    );
  }
}
```

### Example App

Here is a simple example of an application using the `appform` package:

```dart
import 'package:flutter/material.dart';
import 'test_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppForm Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppForm Example')),
      body: const Center(child: TestForm()),
    );
  }
}
```

## License

This project is licensed under the MIT License.
