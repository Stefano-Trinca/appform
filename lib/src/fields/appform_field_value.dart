import '../../appform.dart';

class AppFormField<T> extends AppFormFieldBase<T?> {
  AppFormField({
    super.key,
    T? value,
    List<FormValidator<T>>? validators,
  }) : super(value: value, validators: validators ?? []);

  @override
  void clear() {
    super.set(null);
  }
}
