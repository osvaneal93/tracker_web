import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soriana_tracker/core/utils/colors.dart';
import 'package:soriana_tracker/domain/repository/auth_repository.dart';
import 'package:soriana_tracker/ui/bloc/app/app_bloc.dart';
import 'package:soriana_tracker/ui/routes/routes.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(key: key);

  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AppBloc(authRepository: _authRepository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:

          //  HomeView()
          FlowBuilder<AppStatus>(
        state: context.select((AppBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
      theme: ThemeData(
          colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: colors.orangePrimary,
        onPrimary: colors.greenPrimary,
        secondary: colors.orangeSecondary,
        onSecondary: colors.sorianaGreen,
        error: colors.errorColor,
        onError: colors.backgroundErrorSecondaryColor,
        background: colors.grayLight,
        onBackground: colors.grayLightSecondary,
        surface: colors.grayLightSecondary,
        onSurface: colors.grayLightSecondary,
      )),
    );
  }
}
