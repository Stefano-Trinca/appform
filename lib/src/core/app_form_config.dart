import 'package:flutter/material.dart';

class AppFormConfig<T> {
  final Function(T result)? onSuccess;
  final VoidCallback? onCancel;
  final VoidCallback? onFailed;
  final Function(T value)? onChange;

  AppFormConfig({
    this.onSuccess,
    this.onCancel,
    this.onFailed,
    this.onChange,
  });
}
