import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/form_page_cubit.dart';


class FormPage extends StatelessWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormPageCubit(),
      child: const Scaffold(
        body: _Form(),
      ),
    );
  }
}


class _Form extends StatelessWidget {
  const _Form({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormPageCubit, FormPageState>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            AppFormTextFieldWidget(field: state.nameField, hint: 'Nome'),
            AppFormTextFieldWidget(field: state.surnameField, hint: 'Cognome'),


            // TextFormField(
            //   controller:,
            //   decoration: InputDecoration(
            //       hintText: 'Età'
            //   ),
            // ),

            SizedBox(height: 24,),
            FilledButton(onPressed: () => context.read<FormPageCubit>().submit(),
                child: Text('Validate')
            ),

          ],
        );
      },
    );
  }
}


class AppFormTextFieldWidget<T> extends StatelessWidget {
  const AppFormTextFieldWidget({super.key, required this.field, required this.hint});

  final AppFormFieldString field;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: field,
      builder: (context, value, child) => TextFormField(
        controller: field.controller,
        decoration: InputDecoration(
            hintText: hint,
            errorText: value.error
        ),
      ),
    );
  }
}

