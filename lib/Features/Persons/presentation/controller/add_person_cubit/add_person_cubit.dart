import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_person_state.dart';

class AddPersonCubit extends Cubit<AddPersonState> {
  AddPersonCubit() : super(AddPersonInitial());
}
