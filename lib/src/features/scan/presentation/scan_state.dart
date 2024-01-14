import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanState {
  final AsyncValue<String?> value;
  ScanState({
    this.value = const AsyncData(null),
  });

  bool get isLoading => value.isLoading;

  ScanState copyWith({
    AsyncValue<String?>? value,
    bool? isObscure,
  }) {
    return ScanState(
      value: value ?? this.value,
    );
  }
}
