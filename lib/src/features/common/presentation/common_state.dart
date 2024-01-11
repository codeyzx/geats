import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geats/src/features/home/presentation/home_page.dart';
import 'package:geats/src/features/domain.dart';
import 'package:geats/src/features/home/presentation/home_page.dart';

class CommonState {
  final bool isHomeActive;
  final bool isExploreActive;
  final bool isEventsActive;
  final bool isProfileActive;
  final bool isLastPage;
  final int currentIndex;
  final Widget currentScreen;
  final AsyncValue<User?> userValue;
  final User? user;

  CommonState({
    this.isHomeActive = true,
    this.isExploreActive = false,
    this.isEventsActive = false,
    this.isProfileActive = false,
    this.isLastPage = false,
    this.currentIndex = 0,
    this.currentScreen = const HomePage(),
    this.userValue = const AsyncLoading(),
    this.user,
  });

  CommonState copyWith({
    bool? isHomeActive,
    bool? isExploreActive,
    bool? isEventsActive,
    bool? isProfileActive,
    bool? isLastPage,
    int? currentIndex,
    Widget? currentScreen,
    AsyncValue<User?>? userValue,
    User? user,
  }) {
    return CommonState(
      isHomeActive: isHomeActive ?? this.isHomeActive,
      isExploreActive: isExploreActive ?? this.isExploreActive,
      isEventsActive: isEventsActive ?? this.isEventsActive,
      isProfileActive: isProfileActive ?? this.isProfileActive,
      isLastPage: isLastPage ?? this.isLastPage,
      currentIndex: currentIndex ?? this.currentIndex,
      currentScreen: currentScreen ?? this.currentScreen,
      userValue: userValue ?? this.userValue,
      user: user ?? this.user,
    );
  }
}
