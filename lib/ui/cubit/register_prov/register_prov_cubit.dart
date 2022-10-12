import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'register_prov_state.dart';

class RegisterProvCubit extends Cubit<RegisterProvState> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController secondLastNameController =
      TextEditingController();
  final TextEditingController imssNumber = TextEditingController();
  final TextEditingController rfcNumber = TextEditingController();
  final TextEditingController curpNumber = TextEditingController();
  final TextEditingController placeOfBirth = TextEditingController();
  final TextEditingController residence = TextEditingController();
  final TextEditingController cp = TextEditingController();
  final TextEditingController position = TextEditingController();
  final TextEditingController department = TextEditingController();
  final TextEditingController observations = TextEditingController();

  RegisterProvCubit() : super(const RegisterProvInitial(index: 0));

  Future<void> registerUser() async {
    emit(SavingProv());
    await Future.delayed(Duration(seconds: 4));
    emit(SavedProv());
  }

  Future<void> newRegister() async {
    emit(SavingProv());
    await Future.delayed(Duration(seconds: 2));
    emit(RegisterProvInitial());
  }

  void cleanFields() {
    nameController.clear();
    lastNameController.clear();
    secondLastNameController.clear();
    imssNumber.clear();
    rfcNumber.clear();
    curpNumber.clear();
    placeOfBirth.clear();
    residence.clear();
    cp.clear();
    position.clear();
    department.clear();
    observations.clear();
  }

  void changeCategory(int index) {
    emit(RegisterProvState(index: index));
  }
}
