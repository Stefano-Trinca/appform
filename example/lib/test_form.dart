import 'package:appform/appform.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/test_form_cubit.dart';

class TestForm extends StatelessWidget {
  const TestForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestFormCubit(),
      child: const _Page(),
    );
  }
}

class _Page extends StatelessWidget {
  const _Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        FieldName(),
        FieldEmail(),
        FieldPassword(),
        TestFormFieldDate(),
        TestFormFieldTime(),
        SizedBox(height: 24),
        ButtonValidate(),
        ButtonClear(),
      ],
    );
  }
}

class FieldName extends StatelessWidget {
  const FieldName({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestFormCubit, TestFormState>(
      buildWhen: (previous, current) => (previous.name != current.name),
      builder: (context, state) {
        return TextFormField(
          controller: state.name.controller,
          decoration:
              InputDecoration(hintText: 'Nome', errorText: state.name.error),
          onChanged: (value) =>
              context.read<TestFormCubit>().fieldUpdate(state.name.key, value),
        );
      },
    );
  }
}

class FieldEmail extends StatelessWidget {
  const FieldEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestFormCubit, TestFormState>(
      buildWhen: (previous, current) => (previous.email != current.email),
      builder: (context, state) {
        return TextFormField(
          initialValue: state.email.value,
          decoration:
              InputDecoration(hintText: 'Email', errorText: state.email.error),
          onChanged: (value) =>
              context.read<TestFormCubit>().fieldUpdate(state.email.key, value),
        );
      },
    );
  }
}

class FieldPassword extends StatelessWidget {
  const FieldPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestFormCubit, TestFormState>(
      buildWhen: (previous, current) => (previous.password != current.password),
      builder: (context, state) {
        return PasswordTextField(
          initialValue: state.password.value,
          decoration: InputDecoration(
              hintText: 'Password', errorText: state.password.error),
          onChanged: (value) => context
              .read<TestFormCubit>()
              .fieldUpdate(state.password.key, value),
        );
      },
    );
  }
}

class TestFormFieldDate extends StatelessWidget {
  const TestFormFieldDate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestFormCubit, TestFormState>(
      buildWhen: (previous, current) =>
          (previous.fieldDate != current.fieldDate),
      builder: (context, state) {
        return DateTimeTextField(
          value: state.fieldDate.value,
          decoration: InputDecoration(
            hintText: 'Data',
            errorText: state.fieldDate.error,
          ),
          format: 'dd MMM yyyy',
          showDateTimePicker: (context, initialDate) => showDatePicker(
              context: context,
              firstDate: DateTime(2023),
              lastDate: DateTime(2025),
              initialDate: DateTime(2024)),
          onChanged: (value) =>
              context.read<TestFormCubit>().fieldUpdate('date', value),
        );
      },
    );
  }
}

class TestFormFieldTime extends StatelessWidget {
  const TestFormFieldTime({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestFormCubit, TestFormState>(
      buildWhen: (previous, current) =>
          (previous.fieldTime != current.fieldTime),
      builder: (context, state) {
        return TimeOfDayTextField(
          value: state.fieldTime.value,
          decoration: InputDecoration(
            hintText: 'Ora',
            errorText: state.fieldTime.error,
          ),
          showTimeOfDayPicker: (context, time) => showTimePicker(
            context: context,
            initialTime: time ?? TimeOfDay.now(),
          ),
          onChanged: (value) =>
              context.read<TestFormCubit>().fieldUpdate('time', value),
        );
      },
    );
  }
}

class ButtonValidate extends StatelessWidget {
  const ButtonValidate({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.read<TestFormCubit>().validateForm(),
      child: const Text('Validate'),
    );
  }
}

class ButtonClear extends StatelessWidget {
  const ButtonClear({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: () => context.read<TestFormCubit>().fieldClear('name'),
      child: const Text('Clear'),
    );
  }
}
