import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/recycle/application/recycle_service.dart';
import 'package:geats/src/features/recycle/domain/deliver.dart';
import 'package:geats/src/features/recycle/presentation/recycle_state.dart';

class RecycleController extends StateNotifier<RecycleState> {
  final RecycleService _recycleService;

  RecycleController(this._recycleService) : super(RecycleState());

  final descController = TextEditingController();

  Future<void> getFoodbank() async {
    state = state.copyWith(
      foodbankValue: const AsyncLoading(),
    );

    final result = await _recycleService.getFoodBank();

    result.when(
      success: (data) {
        state = state.copyWith(
          foodbankValue: AsyncData(data),
          foodbank: data,
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          foodbankValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  Future<void> getDeliver(String uid) async {
    state = state.copyWith(
      deliverValue: const AsyncLoading(),
    );

    final result = await _recycleService.getDeliver(uid);

    result.when(
      success: (data) {
        state = state.copyWith(
          deliverValue: AsyncData(data),
          deliver: data,
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          deliverValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  Future<void> addDeliver(String uid) async {
    state = state.copyWith(
      isGetLoading: const AsyncLoading(),
    );

    final random = Random().nextInt(20 - 2) + 2;

    final deliver = Deliver(
      id: '',
      uid: uid,
      type: state.type,
      condition: state.condition,
      weight: state.weight,
      desc: descController.text,
      coins: random,
      location: state.selectedFoodbank,
      status: 'Success',
      timestamp: DateTime.now(),
    );

    final result = await _recycleService.addDeliver(deliver);

    result.when(
      success: (data) {
        state = state.copyWith(
          isGetLoading: const AsyncData(true),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          deliverValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void setOverlayVisible() {
    state = state.copyWith(
      isOverlayVisible: !state.isOverlayVisible,
    );
  }

  void setType(String type) {
    state = state.copyWith(
      type: type,
    );
  }

  void setCondition(String condition) {
    state = state.copyWith(
      condition: condition,
    );
  }

  void setWeight(String weight) {
    state = state.copyWith(
      weight: weight,
    );
  }

  void setSelectedFoodbank(String foodbank) {
    state = state.copyWith(
      selectedFoodbank: foodbank,
    );
  }

  @override
  void dispose() {
    descController.dispose();
    super.dispose();
  }
}

final recycleControllerProvider =
    StateNotifierProvider.autoDispose<RecycleController, RecycleState>((ref) {
  final recycleService = ref.read(recycleServiceProvider);
  return RecycleController(recycleService);
});
