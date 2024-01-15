import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/scan/domain/nutrifacts.dart';

class ScanState {
  final AsyncValue<List<NutriFacts>> nutriValue;
  final List<NutriFacts>? nutri;
  ScanState({
    this.nutriValue = const AsyncData([]),
    this.nutri,
  });

  bool get isLoading => nutriValue.isLoading;

  ScanState copyWith({
    AsyncValue<List<NutriFacts>>? nutriValue,
    List<NutriFacts>? nutri,
  }) {
    return ScanState(
      nutriValue: nutriValue ?? this.nutriValue,
      nutri: nutri ?? this.nutri,
    );
  }
}
