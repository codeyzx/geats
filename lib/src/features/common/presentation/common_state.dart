import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/domain.dart';
import 'package:geats/src/features/home/presentation/home_page.dart';

List<String> gender = [
  "Male",
  "Female",
];

List<String> age = [
  "10", 
  "11", 
  "12", 
  "13", 
  "14", 
  "15", 
  "16", 
  "17", 
  "18", 
  "19", 
  "20", 
  "21", 
  "22", 
  "23", 
  "24", 
  "25", 
  "26", 
  "27", 
  "28", 
  "29", 
  "30", 
  "31", 
  "32", 
  "33", 
  "34", 
  "35", 
  "36", 
  "37", 
  "38", 
  "39", 
  "40", 
  "41", 
  "42", 
  "43", 
  "44", 
  "45", 
  "46", 
  "47", 
  "48", 
  "49", 
  "50", 
  "51", 
  "52", 
  "53", 
  "54", 
  "55", 
  "56", 
  "57", 
  "58", 
  "59", 
  "60", 
  "61", 
  "62", 
  "63", 
  "64", 
  "65", 
  "66", 
  "67", 
  "68", 
  "69", 
  "70", 
  "71", 
  "72", 
  "73", 
  "74", 
  "75", 
  "76", 
  "77", 
  "78", 
  "79", 
  "80", 
  "81", 
  "82", 
  "83", 
  "84", 
  "85", 
  "86", 
  "87", 
  "88", 
  "89", 
  "90", 
  "91", 
  "92", 
  "93", 
  "94", 
  "95", 
  "96", 
  "97", 
  "98", 
  "99", 
  "100"
];

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
  final String? gender;
  final String? age;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
  });

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
    String? age
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
    );
  }
}
