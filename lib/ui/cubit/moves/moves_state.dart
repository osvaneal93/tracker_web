part of 'moves_cubit.dart';

abstract class MovesState extends Equatable {
  final String? dropDownValue;
  const MovesState({this.dropDownValue});

  @override
  List<Object> get props => [dropDownValue!];
}

class MovesInitial extends MovesState {
  MovesInitial({super.dropDownValue});
}
