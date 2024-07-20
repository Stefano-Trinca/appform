/// An enumeration of the possible states for form or process status handling.
///
/// This enum helps to clearly define various states that a form or any process might be in
/// during its lifecycle, from being unaltered, through being edited, to various stages of submission.
enum StateStatus {
  pure,              // Initial state, with no user interaction or data entry.
  editing,           // State indicating that data is currently being edited.
  loading,           // State when data or necessary resources are being loaded.
  error,             // State when an error has occurred.
  valid,             // State indicating that the current data is valid.
  invalid,           // State indicating that the current data is invalid.
  submissionInProgress, // State when a submission process is actively in progress.
  submissionSuccess, // State when a submission has been successfully completed.
  submissionCanceled, // State when a submission has been canceled.
  submissionFailure; // State when a submission has failed.
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