import 'dart:math';

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
      buildWhen: (previous, current) =>
          previous.stateStatus != current.stateStatus,
      builder: (context, state) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 500),
            child: Column(
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
                AppFormFocusFieldBuilder(
                  onFocusLost: () {
                    print('Focus Lost');
                  },
                  onFocusGain: () {
                    print('Focus Gain');
                  },
                  builder: (context, focusNode) => AppFormTextField(
                    field: state.nameField,
                    focusNode: focusNode,
                    hintText: 'Nome',
                  ),
                ),
                AppFormPasswordField(
                  field: state.surnameField,
                  hintText: 'Cognome',
                ),
                AppFormPasswordField(
                  field: state.surnameCompareField,
                  hintText: 'Cognome Uguale',
                ),
                AppFormDateTimeField(
                  field: state.dateField,
                  hintText: 'Selecet Date',
                ),
                AppFormTimeOfDayField(
                  field: state.timeField,
                  hintText: 'Seleziona Ora',
                  enableInteractiveSelection: false,
                ),
                AppFormFieldBuilder<AppFormField<FormStateEnum>,
                    FormStateEnum?>(
                  field: state.stateField,
                  builder: (context, value, child) {
                    return RawChip(
                        onPressed: () => state.stateField
                            .set(FormStateEnum.values[Random().nextInt(2)]),
                        label: Text(value.value?.name ?? ''));
                  },
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
                    onPressed: () => context.read<FormPageCubit>().submit(),
                    child: Text('Validate')),
              ],
            ),
          ),
        );
      },
    );
  }
}
