part of 'register_prov_cubit.dart';

class RegisterProvState extends Equatable {
  final int? index;
  const RegisterProvState({required this.index});

  @override
  List<Object> get props => [index!];
}

class RegisterProvInitial extends RegisterProvState {
  const RegisterProvInitial({super.index});
}

class SavingProv extends RegisterProvState {
  const SavingProv({super.index});
}

class SavedProv extends RegisterProvState {
  const SavedProv({super.index});
}
