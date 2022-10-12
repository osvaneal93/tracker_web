import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'moves_state.dart';

class MovesCubit extends Cubit<MovesState> {
  MovesCubit() : super(MovesInitial(dropDownValue: 'Android'));

  changeDropValue(String value) {
    emit(MovesInitial(dropDownValue: value));
  }
}
