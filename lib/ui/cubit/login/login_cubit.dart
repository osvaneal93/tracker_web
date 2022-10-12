import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soriana_tracker/domain/repository/auth_repository.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;
  final loginFormKey = GlobalKey<FormState>();
  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  String error = '';

  LoginCubit(this._authRepository) : super(LoginState.initial());

  Future<void> logInWithCredentials() async {
    if (state.status == LoginStatus.submitting) return;
    emit(state.copyWith(status: LoginStatus.submitting));
    try {
      final response = await _authRepository.logInWithEmailAndPassword(
        email: loginEmailController.text,
        password: loginPasswordController.text,
      );
      if (response == null) {
        emit(state.copyWith(status: LoginStatus.success));
      } else {
        emit(LoginState.error(response));
        print('ENVIANDO RESPUESTA AL ESTADO: $response');
      }
    } catch (_) {}
  }
}
