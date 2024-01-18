import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/recycle/domain/deliver.dart';
import 'package:geats/src/features/recycle/domain/foodbank.dart';

class RecycleState {
  final AsyncValue<List<FoodBank>> foodbankValue;
  final List<FoodBank>? foodbank;
  final AsyncValue<List<Deliver>> deliverValue;
  final List<Deliver>? deliver;
  final AsyncValue<bool> isGetLoading;
  String type;
  String condition;
  String? location;
  String weight;
  final bool isOverlayVisible;
  String selectedFoodbank;

  RecycleState({
    this.isGetLoading = const AsyncLoading(),
    this.foodbankValue = const AsyncLoading(),
    this.foodbank,
    this.type = 'food',
    this.condition = 'fresh',
    this.location,
    this.weight = 'less than 1 kg',
    this.isOverlayVisible = false,
    this.selectedFoodbank = 'Mekarwangi Food Bank',
    this.deliverValue = const AsyncLoading(),
    this.deliver,
  });

  RecycleState copyWith({
    AsyncValue<List<FoodBank>>? foodbankValue,
    List<FoodBank>? foodbank,
    AsyncValue<List<Deliver>>? deliverValue,
    List<Deliver>? deliver,
    AsyncValue<bool>? isGetLoading,
    String? type,
    String? condition,
    String? location,
    String? weight,
    bool? isOverlayVisible,
    String? selectedFoodbank,
  }) {
    return RecycleState(
      deliverValue: deliverValue ?? this.deliverValue,
      deliver: deliver ?? this.deliver,
      foodbankValue: foodbankValue ?? this.foodbankValue,
      foodbank: foodbank ?? this.foodbank,
      type: type ?? this.type,
      condition: condition ?? this.condition,
      location: location ?? this.location,
      weight: weight ?? this.weight,
      isOverlayVisible: isOverlayVisible ?? this.isOverlayVisible,
      selectedFoodbank: selectedFoodbank ?? this.selectedFoodbank,
      isGetLoading: isGetLoading ?? this.isGetLoading,
    );
  }
}
