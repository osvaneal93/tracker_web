import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soriana_tracker/app.dart';
import 'package:soriana_tracker/domain/repository/auth_repository.dart';
import 'package:soriana_tracker/ui/bloc/simple_bloc_observer.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver(); // Crear simpleBlocObserver
  runApp(App(
    authRepository: AuthRepository(),
  )); // App
}
