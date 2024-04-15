

import 'package:flutter/cupertino.dart';

import '../state/state_status.dart';

abstract class AppFormInstance<T, E> {
  const AppFormInstance._(this.value, [this.pure = true]);

  /// Constructor which create a `pure` [AppFormInstance] with a given value.
  AppFormInstance.pure(T value) : this._(ValueNotifier<T>(value));

  /// Constructor which create a `dirty` [AppFormInstance] with a given value.
  AppFormInstance.dirty(T value) : this._(ValueNotifier<T>(value), false);

  /// The value of the given [AppFormInstance].
  /// For example, if you have a `AppFormInstance` for `FirstName`,
  /// the value could be 'Joe'.
  final ValueNotifier<T> value;

  /// If the [AppFormInstance] is pure (has been touched/modified).
  /// Typically when the `AppFormInstance` is initially created,
  /// it is created using the `AppFormInstance.pure` constructor to
  /// signify that the user has not modified it.
  ///
  /// For subsequent changes (in response to user input), the
  /// `AppFormInstance.dirty` constructor should be used to signify that
  /// the `AppFormInstance` has been manipulated.
  final bool pure;

  /// The [StateStatus] which can be one of the following:
  /// * [StateStatus.pure]
  ///   - if the input has not been modified.
  /// * [StateStatus.invalid]
  ///   - if the input has been modified and validation failed.
  /// * [StateStatus.valid]
  ///   - if the input has been modified and validation succeeded.
  StateStatus get status => pure
      ? StateStatus.pure
      : valid
      ? StateStatus.valid
      : StateStatus.invalid;

  /// Returns a validation error if the [AppFormInstance] is invalid.
  /// Returns `null` if the [AppFormInstance] is valid.
  E? get error => validator(value.value);

  /// Whether the [AppFormInstance] value is valid according to the
  /// overridden `validator`.
  ///
  /// Returns `true` if `validator` returns `null` for the
  /// current [AppFormInstance] value and `false` otherwise.
  bool get valid => validator(value.value) == null;

  /// Whether the [AppFormInstance] value is not valid.
  /// A value is invalid when the overridden `validator`
  /// returns an error (non-null value).
  bool get invalid => status == StateStatus.invalid;

  /// A function that must return a validation error if the provided
  /// [value] is invalid and `null` otherwise.
  E? validator(T value);

  @override
  int get hashCode => value.hashCode ^ pure.hashCode;

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is AppFormInstance<T, E> &&
        other.value == value &&
        other.pure == pure;
  }

  @override
  String toString() => '$runtimeType($value, $pure)';
}

/// Class which contains methods that help manipulate and manage
/// [StateStatus]
class AppFormMethods {
  /// Returns a [StateStatus] given a list of [AppFormInstance].
  static StateStatus validate(List<AppFormInstance> inputs) {
    return inputs.every((element) => element.pure)
        ? StateStatus.pure
        : inputs.any((input) => input.valid == false)
        ? StateStatus.invalid
        : StateStatus.valid;
  }
}

/// Mixin that automatically handles validation of all [AppFormInstance]s present in
/// the [inputs].
///
/// When mixing this in, you are required to override the [inputs] getter and
/// provide all [AppFormInstance]s you want to automatically validate.
///
/// ```dart
/// class LoginFormState with AppForm {
///  LoginFormState({
///    this.username = const Username.pure(),
///    this.password = const Password.pure(),
///  });
///
///  final Username username;
///  final Password password;
///
///  @override
///  List<AppFormInstance> get inputs => [username, password];
/// }
/// ```
mixin AppForm {
  /// [StateStatus] getter which computes the status based on the
  /// validity of the [inputs].
  StateStatus get status => AppFormMethods.validate(inputs);

  /// Returns all [AppFormInstance] instances.
  ///
  /// Override this and give it all [AppFormInstance]s in your class that should be
  /// validated automatically.
  List<AppFormInstance> get inputs;
}