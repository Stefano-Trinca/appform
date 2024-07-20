import 'package:appform/appform.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'test_form_state.dart';

class TestFormCubit extends Cubit<TestFormState> with AppFormCubit {
  TestFormCubit() : super(TestFormState());
}
