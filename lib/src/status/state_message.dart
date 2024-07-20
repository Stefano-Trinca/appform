import 'package:equatable/equatable.dart';

enum StateMessageType {
  pure,
  delete,
  confirm,
  error;

  bool get isPure => this == StateMessageType.pure;

  bool get isDelete => this == StateMessageType.delete;

  bool get isConfirm => this == StateMessageType.confirm;

  bool get isError => this == StateMessageType.error;
}

class StateMessage<T> extends Equatable {
  final String message;
  final StateMessageType type;
  final T? value;

  const StateMessage(
    this.message, {
    required this.type,
    this.value,
  });

  const StateMessage.error(
    this.message, {
    this.value,
  }) : this.type = StateMessageType.error;

  const StateMessage.pure(
    this.message, {
    this.value,
  }) : this.type = StateMessageType.pure;

  const StateMessage.delete(
    this.message, {
    this.value,
  }) : this.type = StateMessageType.delete;

  const StateMessage.confirm(
    this.message, {
    this.value,
  }) : this.type = StateMessageType.confirm;

  const StateMessage.empty()
      : this.message = '',
        this.type = StateMessageType.pure,
        this.value = null;

  StateMessage copyWith({
    String? message,
    StateMessageType? type,
    T? value,
  }) {
    return StateMessage(
      message ?? this.message,
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  bool get isEmpty => message.isEmpty;

  @override
  List<Object?> get props => [message, type, value];
}
