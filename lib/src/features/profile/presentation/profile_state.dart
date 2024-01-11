import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/auth/domain/user.dart';

class UserState {
  final AsyncValue<User?> userValue;
  final AsyncValue<String?> loadingValue;
  final User? user;

  UserState({
    this.userValue = const AsyncLoading(),
    this.loadingValue = const AsyncData(''),
    this.user,
  });

  UserState copyWith({
    AsyncValue<User?>? userValue,
    AsyncValue<String?>? loadingValue,
    User? user,
  }) {
    return UserState(
      userValue: userValue ?? this.userValue,
      loadingValue: loadingValue ?? this.loadingValue,
      user: user ?? this.user,
    );
  }
}
