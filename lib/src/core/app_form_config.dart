import 'package:flutter/material.dart';

class AppFormConfig<T> {
  final Function(T result)? onSuccess;
  final VoidCallback? onCancel;
  final VoidCallback? onFailed;
  final Function(T value)? onChange;
  final Future<bool> Function(T value)? onSubmit;

  AppFormConfig({
    this.onSuccess,
    this.onCancel,
    this.onFailed,
    this.onChange,
    this.onSubmit,
  });
}
