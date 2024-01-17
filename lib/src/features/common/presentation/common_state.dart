import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/domain.dart';
import 'package:geats/src/features/home/presentation/home_page.dart';

class CommonState {
  final bool isHomeActive;
  final bool isAnalyzeActive;
  final bool isRecycleActive;
  final bool isProfileActive;
  final bool isLastPage;
  final int currentIndex;
  final Widget currentScreen;
  final AsyncValue<User?> userValue;
  final User? user;
  final String gender;
  final String age;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Activity? activity;
  final WeightGoal? weightGoal;
  final List<Map<String, String>> ageList;
  final AsyncValue<bool?> isGetLoading;

  CommonState({
    this.isHomeActive = true,
    this.isAnalyzeActive = false,
    this.isRecycleActive = false,
    this.isProfileActive = false,
    this.isLastPage = false,
    this.currentIndex = 0,
    this.currentScreen = const HomePage(),
    this.userValue = const AsyncLoading(),
    this.user,
    this.gender = "Male",
    this.age = "10",
    this.activity = Activity.rare,
    this.weightGoal = WeightGoal.lose,
    this.isGetLoading = const AsyncLoading(),
  }) : ageList = List.generate(91, (index) => index + 10)
            .map((e) => {'value': e.toString(), 'text': e.toString()})
            .toList();

  CommonState copyWith({
    bool? isHomeActive,
    bool? isAnalyzeActive,
    bool? isRecycleActive,
    bool? isProfileActive,
    bool? isLastPage,
    int? currentIndex,
    Widget? currentScreen,
    AsyncValue<User?>? userValue,
    User? user,
    String? gender,
    String? age,
    Activity? activity,
    WeightGoal? weightGoal,
    AsyncValue<bool?>? isGetLoading,
  }) {
    return CommonState(
      isHomeActive: isHomeActive ?? this.isHomeActive,
      isAnalyzeActive: isAnalyzeActive ?? this.isAnalyzeActive,
      isRecycleActive: isRecycleActive ?? this.isRecycleActive,
      isProfileActive: isProfileActive ?? this.isProfileActive,
      isLastPage: isLastPage ?? this.isLastPage,
      currentIndex: currentIndex ?? this.currentIndex,
      currentScreen: currentScreen ?? this.currentScreen,
      userValue: userValue ?? this.userValue,
      user: user ?? this.user,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      activity: activity ?? this.activity,
      weightGoal: weightGoal ?? this.weightGoal,
      isGetLoading: isGetLoading ?? this.isGetLoading,
    );
  }
}
