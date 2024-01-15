import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/gen/assets.gen.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/routes/routes.dart';
import 'package:go_router/go_router.dart';

class BotNavBarPage extends ConsumerWidget {
  const BotNavBarPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commonControllerProvider);
    final controller = ref.read(commonControllerProvider.notifier);
    final currentIndex = state.currentIndex;
    final currentScreen = state.currentScreen;
    final bucket = PageStorageBucket();

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: SizedBox(
          height: 65.0,
          width: 65.0,
          child: FittedBox(
            child: FloatingActionButton(
              shape: const CircleBorder(),
              backgroundColor: ColorApp.black,
              child: Assets.icons.icScan.svg(
                width: 28.w,
                height: 28.h,
              ),
              onPressed: () {
                context.pushNamed(
                  Routes.scan.name,
                  extra: const Extras(
                    datas: {
                      ExtrasKey.isCompare: false,
                    },
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          iconSize: 24.0.sp,
          currentIndex: currentIndex,
          onTap: (index) => controller.setPage(index),
          items: [
            BottomNavigationBarItem(
              icon: !state.isHomeActive
                  ? Assets.icons.icHomeDeactive.svg()
                  : Assets.icons.icHomeActive.svg(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: !state.isExploreActive
                  ? Assets.icons.icAnalyzeDeactive.svg()
                  : Assets.icons.icAnalyzeActive.svg(),
              label: '',
            ),
            BottomNavigationBarItem(icon: SizedBox(width: 40.w), label: ''),
            BottomNavigationBarItem(
              icon: !state.isEventsActive
                  ? Assets.icons.icRecycleDeactive.svg()
                  : Assets.icons.icRecycleActive.svg(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: !state.isProfileActive
                  ? Assets.icons.icProfileDeactive.svg()
                  : Assets.icons.icProfileActive.svg(),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
