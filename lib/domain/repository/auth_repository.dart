// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:soriana_tracker/data/models/user_model.dart';

class AuthRepository {
  final firebase_auth.FirebaseAuth _firebaseAuth;

  AuthRepository({
    firebase_auth.FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  var currentUser = User.empty;

  Stream<User> get user {
    //TODO Quitar redundancia
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final user = firebaseUser == null ? User.empty : firebaseUser.toUser;
      currentUser = user;
      return user;
    });
  }

  Future<void> signup({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (_) {}
  }

  Future<dynamic> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on firebase_auth.FirebaseAuthException catch (e) {
      final String error = e.message!;
      print(error);
      return error;
    }
  }

  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
      ]);
    } catch (_) {}
  }
}

extension on firebase_auth.User {
  User get toUser {
    return User(id: uid, email: email, name: displayName, photo: photoURL);
  }
}
