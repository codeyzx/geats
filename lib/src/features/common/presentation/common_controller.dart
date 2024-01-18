import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/analyze/presentation/analyze_page.dart';
import 'package:geats/src/features/auth/domain/request_user.dart';
import 'package:geats/src/features/auth/domain/user.dart';
import 'package:geats/src/features/recycle/presentation/recycle_page.dart';
import 'package:geats/src/shared/extensions/extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:geats/src/features/common/application/common_service.dart';
import 'package:geats/src/features/profile/presentation/profile_page.dart';
import 'package:geats/src/features/common/presentation/common_state.dart';
import 'package:geats/src/features/home/presentation/home_page.dart';
import 'package:geats/src/routes/app_routes.dart';

class CommonController extends StateNotifier<CommonState> {
  final CommonService _commonService;

  CommonController(
    this._commonService,
  ) : super(CommonState()) {
    getProfile();
    setPage(0);
  }

  final weightController = TextEditingController();
  final heightController = TextEditingController();
  final nameController = TextEditingController();
  final ageController = TextEditingController();

  Future<void> getProfile() async {
    state = state.copyWith(
      userValue: const AsyncLoading(),
    );
    final result = await _commonService.getProfile();
    result.when(
      success: (data) {
        state = state.copyWith(
          user: data,
          userValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          userValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void setData(User user) {
    nameController.text = user.name;
    heightController.text = user.height.toString();
    weightController.text = user.weight.toString();
    ageController.text = user.age.toString();

    state = state.copyWith(
      user: user,
      userValue: AsyncData(user),
      activity: user.activity,
      weightGoal: user.weightGoal,
    );
  }

  Future<void> updateProfile(RequestUser user) async {
    state = state.copyWith(
      isGetLoading: const AsyncLoading(),
    );

    final result = await _commonService.updateProfile(user);

    result.when(
      success: (data) {
        state = state.copyWith(
          isGetLoading: const AsyncData(true),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          isGetLoading: AsyncError(error, stackTrace),
        );
      },
    );
  }

  Future<void> updateDiet(Map<String, dynamic> user) async {
    state = state.copyWith(
      isGetLoading: const AsyncLoading(),
    );
    final result = await _commonService.updateDiet(user);
    result.when(
      success: (data) {
        state = state.copyWith(
          isGetLoading: const AsyncData(true),
        );
      },
      failure: (error, stackTrace) {
        state = state.copyWith(
          userValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void logout() {
    _commonService.logout();
    navigatorKey.currentContext!.goNamed(Routes.login.name);
    setPage(0);
    state = state.copyWith(
      user: null,
      userValue: const AsyncData(null),
    );
  }

  void setPage(index) {
    state = state.copyWith(
      currentIndex: index,
      currentScreen: _getScreen(index),
      isHomeActive: index == 0,
      isAnalyzeActive: index == 1,
      isRecycleActive: index == 3,
      isProfileActive: index == 4,
    );
  }

  void setLastPage(bool value) {
    state = state.copyWith(
      isLastPage: value,
    );
  }

  void setGender(String gender) {
    state = state.copyWith(
      gender: gender,
    );
  }

  void setAge(String? age) {
    state = state.copyWith(
      age: age,
    );
  }

  void setActivity(String? activity) {
    final activityValue = activity?.getActivity;
    state = state.copyWith(
      activity: activityValue,
    );
  }

  void setWeightGoal(String? weight) {
    final weightValue = weight?.getWeightGoal;
    state = state.copyWith(
      weightGoal: weightValue,
    );
  }

  Map<String, dynamic> calculateDiet(
      {required double weight,
      required double height,
      required int age,
      required String gender,
      required WeightGoal weightGoal,
      required Activity activity,
      bool? isUpdateProfile}) {
    double bmr = (10 * weight) +
        (6.25 * height) -
        (5 * age) +
        (gender == 'Male' ? 5 : -161);

    // Activity level multiplier
    double activityLevelMultiplier = 1;
    switch (activity) {
      case Activity.rare:
        activityLevelMultiplier = 1.2;
        break;
      case Activity.medium:
        activityLevelMultiplier = 1.375;
        break;
      case Activity.active:
        activityLevelMultiplier = 1.55;
        break;
    }

    // Calculate Daily Calories
    double dailyCalories = bmr * activityLevelMultiplier;

    // Adjust calories based on goal
    switch (weightGoal) {
      case WeightGoal.gain:
        dailyCalories += 500;
        break;
      case WeightGoal.lose:
        dailyCalories -= 500;
        break;
      case WeightGoal.maintain:
        break;
    }

    // Macronutrient percentages
    double proteinPercentage = 0.4;

    double fatsPercentage = 0.0;
    switch (weightGoal) {
      case WeightGoal.gain:
        fatsPercentage = 0.3;
        break;
      case WeightGoal.lose:
        fatsPercentage = 0.4;
        break;
      case WeightGoal.maintain:
        fatsPercentage = 0.4;
        break;
    }

    double carbsPercentage = 0.0;
    switch (weightGoal) {
      case WeightGoal.gain:
        carbsPercentage = 0.3;
        break;
      case WeightGoal.lose:
        carbsPercentage = 0.2;
        break;
      case WeightGoal.maintain:
        carbsPercentage = 0.3;
        break;
    }

    double sugarPercentage = 0.1;

    // Calculate grams of each macronutrient
    double protein = (proteinPercentage * dailyCalories / 4);
    double fats = (fatsPercentage * dailyCalories / 9);
    double carbs = (carbsPercentage * dailyCalories / 4);
    double sugar = (sugarPercentage * dailyCalories / 4);

    // take the ceiling of each value
    dailyCalories = dailyCalories.ceilToDouble();
    protein = protein.ceilToDouble();
    fats = fats.ceilToDouble();
    carbs = carbs.ceilToDouble();
    sugar = sugar.ceilToDouble();

    // Display results
    if (isUpdateProfile != null && isUpdateProfile) {
      return {
        'caloriesGoal': dailyCalories.toInt(),
        'proteinsGoal': protein.toInt(),
        'fatGoal': fats.toInt(),
        'carbsGoal': carbs.toInt(),
        'sugarsGoal': sugar.toInt(),
        'weightGoal': weightGoal.name,
      };
    } else {
      return {
        'caloriesGoal': dailyCalories.toInt(),
        'proteinsGoal': protein.toInt(),
        'fatGoal': fats.toInt(),
        'carbsGoal': carbs.toInt(),
        'sugarsGoal': sugar.toInt(),
        'gender': gender,
        'age': age,
        'weight': weight,
        'height': height,
        'activity': activity.name,
        'weightGoal': weightGoal.name,
      };
    }
  }

  String? validateWeight(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }

  String? validateHeight(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }

  Widget _getScreen(index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const AnalyzePage();
      case 3:
        return const RecyclePage();
      case 4:
        return const ProfilePage();
      default:
        return const HomePage();
    }
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

final commonControllerProvider =
    StateNotifierProvider.autoDispose<CommonController, CommonState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return CommonController(commonService);
});
