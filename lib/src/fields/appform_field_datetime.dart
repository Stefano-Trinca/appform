import '../../appform.dart';

class AppFormFieldDateTime extends AppFormField<DateTime?> {
  AppFormFieldDateTime({
    super.key,
    DateTime? date,
    List<FormValidator<DateTime>>? validators,
    bool initialValueNow = false,
  }) : super(
            value: date ?? (initialValueNow ? DateTime.now() : null), validators: validators ?? []);

  @override
  void clear() {
    super.set(null);
  }
}
