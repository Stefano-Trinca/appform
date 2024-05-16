import '../../appform.dart';

class AppFormFieldBool extends AppFormFieldBase<bool?> {
  AppFormFieldBool({
    super.key,
    bool? value,
    List<FormValidator<bool>>? validators,
  }) : super(value: value, validators: validators ?? []);

  @override
  void clear() {
    super.set(null);
  }
}
