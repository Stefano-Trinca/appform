

abstract class FormzInput<T, E> {
  const FormzInput._(this.value, [this.pure = true]);

  /// Constructor which create a `pure` [FormzInput] with a given value.
  const FormzInput.pure(T value) : this._(value);

  /// Constructor which create a `dirty` [FormzInput] with a given value.
  const FormzInput.dirty(T value) : this._(value, false);

  /// The value of the given [FormzInput].
  /// For example, if you have a `FormzInput` for `FirstName`,
  /// the value could be 'Joe'.
  final T value;

  /// If the [FormzInput] is pure (has been touched/modified).
  /// Typically when the `FormzInput` is initially created,
  /// it is created using the `FormzInput.pure` constructor to
  /// signify that the user has not modified it.
  ///
  /// For subsequent changes (in response to user input), the
  /// `FormzInput.dirty` constructor should be used to signify that
  /// the `FormzInput` has been manipulated.
  final bool pure;

  /// The [FormzInputStatus] which can be one of the following:
  /// * [FormzInputStatus.pure]
  ///   - if the input has not been modified.
  /// * [FormzInputStatus.invalid]
  ///   - if the input has been modified and validation failed.
  /// * [FormzInputStatus.valid]
  ///   - if the input has been modified and validation succeeded.
  FormzInputStatus get status => pure
      ? FormzInputStatus.pure
      : valid
      ? FormzInputStatus.valid
      : FormzInputStatus.invalid;

  /// Returns a validation error if the [FormzInput] is invalid.
  /// Returns `null` if the [FormzInput] is valid.
  E? get error => validator(value);

  /// Whether the [FormzInput] value is valid according to the
  /// overridden `validator`.
  ///
  /// Returns `true` if `validator` returns `null` for the
  /// current [FormzInput] value and `false` otherwise.
  bool get valid => validator(value) == null;

  /// Whether the [FormzInput] value is not valid.
  /// A value is invalid when the overridden `validator`
  /// returns an error (non-null value).
  bool get invalid => status == FormzInputStatus.invalid;

  /// A function that must return a validation error if the provided
  /// [value] is invalid and `null` otherwise.
  E? validator(T value);

  @override
  int get hashCode => value.hashCode ^ pure.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is FormzInput<T, E> &&
        other.value == value &&
        other.pure == pure;
  }

  @override
  String toString() => '$runtimeType($value, $pure)';
}

/// Class which contains methods that help manipulate and manage
/// [FormzStatus] and [FormzInputStatus] instances.
class Formz {
  /// Returns a [FormzStatus] given a list of [FormzInput].
  static FormzStatus validate(List<FormzInput> inputs) {
    return inputs.every((element) => element.pure)
        ? FormzStatus.pure
        : inputs.any((input) => input.valid == false)
        ? FormzStatus.invalid
        : FormzStatus.valid;
  }
}

/// Mixin that automatically handles validation of all [FormzInput]s present in
/// the [inputs].
///
/// When mixing this in, you are required to override the [inputs] getter and
/// provide all [FormzInput]s you want to automatically validate.
///
/// ```dart
/// class LoginFormState with FormzMixin {
///  LoginFormState({
///    this.username = const Username.pure(),
///    this.password = const Password.pure(),
///  });
///
///  final Username username;
///  final Password password;
///
///  @override
///  List<FormzInput> get inputs => [username, password];
/// }
/// ```
mixin FormzMixin {
  /// [FormzStatus] getter which computes the status based on the
  /// validity of the [inputs].
  FormzStatus get status => Formz.validate(inputs);

  /// Returns all [FormzInput] instances.
  ///
  /// Override this and give it all [FormzInput]s in your class that should be
  /// validated automatically.
  List<FormzInput> get inputs;
}