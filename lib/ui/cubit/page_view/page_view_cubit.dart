import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:soriana_tracker/ui/cubit/sidebar/sidebar_cubit.dart';

part 'page_view_state.dart';

class PageViewCubit extends Cubit<PageViewState> {
  final PageController pageController = PageController();
  final SidebarCubit sidebarCubit;
  StreamSubscription? streamSubscription;
  PageViewCubit(this.sidebarCubit) : super(PageViewInitial()) {
    streamSubscription = sidebarCubit.stream.listen((state) {
      pageController.jumpToPage(state.index!);
    });
  }
}
