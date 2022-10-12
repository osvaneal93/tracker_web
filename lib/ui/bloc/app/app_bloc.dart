import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:soriana_tracker/data/models/user_model.dart';
import 'package:soriana_tracker/domain/repository/auth_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;

  AppBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(
          authRepository.currentUser.isNotEmpty
              ? AppState.authenticated(authRepository.currentUser)
              : const AppState.unauthenticated(),
        ) {
    on<AppUserChanged>(_onUserChanged);
    on<AppLogoutRequested>(_onLogoutRequested);

    _userSubscription = _authRepository.user.listen(
      (user) => add(AppUserChanged(user)),
    );
  }

  void _onUserChanged(
    AppUserChanged event,
    Emitter<AppState> emit,
  ) {
    emit(
      event.user.isNotEmpty
          ? AppState.authenticated(event.user)
          : const AppState.unauthenticated(),
    );
  }

  Future<void> _onLogoutRequested(
    AppLogoutRequested event,
    Emitter<AppState> emit,
  ) async {
    await Future.delayed(Duration(seconds: 1));
    await _authRepository.logOut();
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
