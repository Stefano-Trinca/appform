import 'package:flutter/material.dart';

import '../../appform.dart';

class AppFormFieldBuilder<F extends AppFormField<T>,T> extends StatelessWidget {
  const AppFormFieldBuilder({super.key, required this.field, required this.builder});

  final F field;
  final Widget Function(BuildContext context, AppFormFieldValue<T> value, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: field,
      builder: builder,
    );
  }
}
