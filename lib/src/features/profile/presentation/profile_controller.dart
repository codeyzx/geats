import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/auth/domain/request_user.dart';
import 'package:geats/src/features/auth/domain/user.dart';
import 'package:geats/src/features/common/application/common_service.dart';
import 'package:geats/src/features/profile/presentation/profile_state.dart';

class UserController extends StateNotifier<UserState> {
  final CommonService _commonService;

  final nameController = TextEditingController();
  final priceController = TextEditingController();
  final polyController = TextEditingController();

  UserController(
    this._commonService,
  ) : super(UserState());

  void setData(User user) {
    nameController.text = user.name;
    state = state.copyWith(
      user: user,
      userValue: AsyncData(user),
    );
  }

  Future<void> updateProfile() async {
    state = state.copyWith(
      loadingValue: const AsyncLoading(),
    );

    final user = RequestUser(
      id: state.user!.id,
      name: nameController.text,
    );

    final result = await _commonService.updateProfile(user);

    result.when(
      success: (data) {
        state = state.copyWith(
          loadingValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          loadingValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    polyController.dispose();
    super.dispose();
  }
}

final userControllerProvider =
    StateNotifierProvider.autoDispose<UserController, UserState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return UserController(commonService);
});
