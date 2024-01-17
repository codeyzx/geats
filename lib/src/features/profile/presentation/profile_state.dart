import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/auth/domain/user.dart';

class UserState {
  final AsyncValue<User?> userValue;
  final AsyncValue<String?> loadingValue;
  final User? user;
  Activity? activity;
  WeightGoal? weightGoal;

  UserState({
    this.userValue = const AsyncLoading(),
    this.loadingValue = const AsyncData(''),
    this.user,
    this.activity,
    this.weightGoal,
  });

  UserState copyWith({
    AsyncValue<User?>? userValue,
    AsyncValue<String?>? loadingValue,
    User? user,
    Activity? activity,
    WeightGoal? weightGoal,
  }) {
    return UserState(
      userValue: userValue ?? this.userValue,
      loadingValue: loadingValue ?? this.loadingValue,
      user: user ?? this.user,
      activity: activity ?? this.activity,
      weightGoal: weightGoal ?? this.weightGoal,
    );
  }
}
