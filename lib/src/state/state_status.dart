import 'package:formz/formz.dart';

enum StateStatus{
  pure,
  editing,
  loading,
  error,
  valid,
  invalid,
  submissionInProgress,
  submissionSuccess,
  submissionCanceled,
  submissionFailure;

  const StateStatus();

  static StateStatus fromFormzStatus(FormzStatus status) => switch(status){
    FormzStatus.submissionFailure => StateStatus.submissionFailure,
    FormzStatus.submissionSuccess => StateStatus.submissionSuccess,
    FormzStatus.submissionInProgress => StateStatus.submissionInProgress,
    FormzStatus.submissionCanceled => StateStatus.submissionCanceled,
    FormzStatus.pure => StateStatus.pure,
    FormzStatus.valid => StateStatus.valid,
    FormzStatus.invalid => StateStatus.invalid,
  };

}

extension StateStatusExt on StateStatus{

  bool get isPure => this == StateStatus.pure;
  bool get isEdit => this == StateStatus.editing;
  bool get isLoading => this == StateStatus.loading;
  bool get isError => this == StateStatus.error;
  bool get isValid => this == StateStatus.valid;
  bool get isInvalid => this == StateStatus.invalid;
  bool get isSubmissionInProgress => this == StateStatus.submissionInProgress;
  bool get isSubmissionSuccess => this == StateStatus.submissionSuccess;
  bool get isSubmissionCanceled => this == StateStatus.submissionCanceled;
  bool get isSubmissionFailure => this == StateStatus.submissionFailure;

}