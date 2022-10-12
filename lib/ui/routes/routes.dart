import 'package:flutter/widgets.dart';
import 'package:soriana_tracker/ui/bloc/app/app_bloc.dart';
import 'package:soriana_tracker/ui/view/home/home_view.dart';
import 'package:soriana_tracker/ui/view/auth/login_view.dart';

List<Page> onGenerateAppViewPages(
  AppStatus state,
  List<Page<dynamic>> pages,
) {
  switch (state) {
    case AppStatus.authenticated:
      return [HomeView.page()];
    case AppStatus.unauthenticated:
      return [LoginView.page()];
  }
}
