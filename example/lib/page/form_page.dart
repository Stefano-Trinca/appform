import 'package:appform/appform.dart';
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
      buildWhen: (previous, current) => previous.stateStatus!=current.stateStatus,
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.stateStatus.isSubmissionFailure)
              Text(
                'Submission Failure',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.red,
                    ),
              ),
            AppFormTextField(
              field: state.nameField,
              hintText: 'Nome',
            ),
            AppFormPasswordField(
              field: state.surnameField,
              hintText: 'Cognome',
            ),
            AppFormPasswordField(
              field: state.surnameCompareField,
              hintText: 'Cognome Uguale',
            ),

            // TextFormField(
            //   controller:,
            //   decoration: InputDecoration(
            //       hintText: 'Età'
            //   ),
            // ),

            SizedBox(
              height: 24,
            ),
            FilledButton(
                onPressed: () => context.read<FormPageCubit>().submit(), child: Text('Validate')),
          ],
        );
      },
    );
  }
}
