import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/recycle/presentation/recycle_page.dart';
import 'package:go_router/go_router.dart';
import 'package:geats/src/features/common/application/common_service.dart';
// import 'package:geats/src/features/history/presentation/history_page.dart';
// import 'package:geats/src/features/inventory/presentation/inventory_page.dart';
import 'package:geats/src/features/profile/presentation/profile_page.dart';
// import 'package:geats/src/features/home/presentation/home_page.dart';
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
      isExploreActive: index == 1,
      isEventsActive: index == 3,
      isProfileActive: index == 4,
    );
  }

  void setLastPage(bool value) {
    state = state.copyWith(
      isLastPage: value,
    );
  }

  Widget _getScreen(index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const ProfilePage();
      case 3:
        return const RecyclePage();
      case 4:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }
}

final commonControllerProvider =
    StateNotifierProvider<CommonController, CommonState>((ref) {
  final commonService = ref.read(commonServiceProvider);
  return CommonController(commonService);
});
