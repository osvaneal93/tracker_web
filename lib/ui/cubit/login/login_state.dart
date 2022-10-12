part of 'login_cubit.dart';

enum LoginStatus { initial, submitting, success, error }

class LoginState extends Equatable {
  final String email;
  final String password;
  final LoginStatus status;
  final String? errorMessage;

  const LoginState({
    this.errorMessage,
    required this.email,
    required this.password,
    required this.status,
  });

  factory LoginState.initial() {
    return const LoginState(
      email: '',
      password: '',
      status: LoginStatus.initial,
    );
  }

  factory LoginState.error(String message) {
    return LoginState(
        email: '',
        password: '',
        status: LoginStatus.error,
        errorMessage: message);
  }

  LoginState copyWith({
    String? email,
    String? password,
    LoginStatus? status,
    String? errorMessage,
  }) {
    return LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        status: status ?? this.status,
        errorMessage: errorMessage ?? '');
  }

  @override
  List<Object> get props => [email, password, status];
}
