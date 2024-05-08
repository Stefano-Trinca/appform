# AppForm

AppForm is a Flutter package designed to simplify form handling and validation within the Flutter_Bloc architecture. By leveraging custom form field classes and comprehensive state management through Flutter_Bloc, AppForm provides a streamlined way to implement complex forms with validation logic.

## Features

- **Custom Form Fields**: Extendable form field classes to encapsulate validation logic and state management.
- **Bloc Integration**: Seamless integration with Flutter_Bloc to manage form states and submissions.
- **Extensible Validators**: Utilize built-in validators or create custom validators to meet your form requirements.

## Getting Started

To start using the AppForm package, add it to your project by including the following in your `pubspec.yaml` file:

```yaml
appform:
  git:
    url: https://github.com/Stefano-Trinca/appform.git
    ref: 0.0.7
```

## Example Usage

Here is a simple example demonstrating how to use AppForm with Flutter_Bloc, with a Cubit controller:

```dart
import 'package:appform/appform.dart';

class MyFormPage extends StatelessWidget {
  const MyFormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MyFormCubit(),
      child: Scaffold(
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatelessWidget {
  const MyForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormCubit, MyFormState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppFormFieldString(
              field: state.nameField,
              hintText: 'Name',
            ),
            // More fields can be added here
            ElevatedButton(
              onPressed: () => context.read<MyFormCubit>().submit(),
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
```

The MyFormCubit class

```dart
import 'package:appform/appform.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'my_form_state.dart';

class MyFormCubit extends Cubit<MyFormState> {
  MyFormCubit() : super(MyFormState());

  void submit() {
    print(state.formValid); //validate the form
  }
}

```
The MyFormState class

```dart
part of 'my_form_cubit.dart';

@immutable
class MyFormState extends Equatable with AppForm {
  final AppFormFieldString nameField;

  MyFormState({
    AppFormFieldString? nameField,
  })  : nameField = nameField ??
      AppFormFieldString(validators: [
        FormValidators.required('Inserisci Nome'),
      ]);

  @override
  List<Object> get props => [nameField];

  @override
  List<AppFormField> get inputs => [nameField];

  FormPageState copyWith({
    AppFormFieldString? nameField,
  }) {
    return FormPageState(
      nameField: nameField ?? this.nameField,
    );
  }
}

```

## Documentation

For further details on how to implement and extend AppForm, please refer to the full documentation available at [GitHub repository](https://github.com/Stefano-Trinca/appform).

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
