import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/auth/domain/request_user.dart';
import 'package:geats/src/features/auth/domain/user.dart';
import 'package:geats/src/features/common/application/common_service.dart';
import 'package:geats/src/features/profile/presentation/profile_state.dart';

class UserController extends StateNotifier<UserState> {
  final CommonService _commonService;

  final nameController = TextEditingController();
  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final ageController = TextEditingController();

  UserController(
    this._commonService,
  ) : super(UserState());

  void setData(User user) {
    nameController.text = user.name;
    heightController.text = user.height.toString();
    weightController.text = user.weight.toString();
    ageController.text = user.age.toString();
    state.activity = user.activity;
    state.weightGoal = user.weightGoal;

    state = state.copyWith(
      user: user,
      userValue: AsyncData(user),
    );
  }

  void setActivity(String? activity) {
    state = state.copyWith(
      activity: Activity.values.firstWhere(
        (element) => element.name == activity,
      ),
    );
  }

  void setWeightGoal(String? weightGoal) {
    state = state.copyWith(
      weightGoal: WeightGoal.values.firstWhere(
        (element) => element.name == weightGoal,
      ),
    );
  }

  Future<void> updateProfile() async {
    state = state.copyWith(
      loadingValue: const AsyncLoading(),
    );

    final user = RequestUser(
      id: state.user!.id,
      name: nameController.text,
      height: double.parse(heightController.text),
      weight: double.parse(weightController.text),
      age: int.parse(ageController.text),
      activity: state.activity!.name,
      weightGoal: state.weightGoal!.name,
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
    heightController.dispose();
    weightController.dispose();
    ageController.dispose();
    super.dispose();
  }
}

final userControllerProvider =
    StateNotifierProvider.autoDispose<UserController, UserState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return UserController(commonService);
});
