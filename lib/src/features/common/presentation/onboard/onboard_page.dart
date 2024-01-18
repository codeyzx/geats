import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:geats/gen/assets.gen.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/onboard/widget/onboarding_content.dart';
import 'package:geats/src/routes/app_routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardPage extends ConsumerWidget {
  const OnboardPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commonControllerProvider);
    final controllerState = ref.read(commonControllerProvider.notifier);
    final controller = PageController();

    return StatusBarWidget(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 30.h),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              controllerState.setLastPage(index == 2);
            },
            children: [
              OnboardingContent(
                imageAsset: Assets.images.onboardImg1,
                imageWidth: 300,
                imageHeight: 230,
                title: "Personalized Diet Planning",
                subtitle:
                    "Tailor your daily diet to your preferences and nutritional needs for a personalized wellness journey.",
              ),
              OnboardingContent(
                imageAsset: Assets.images.onboardImg2,
                imageWidth: 300,
                imageHeight: 230,
                title: "Nutrition Compare",
                subtitle:
                    "Make informed, healthier choices by comparing nutritional content of different foods.",
              ),
              OnboardingContent(
                imageAsset: Assets.images.onboardImg3,
                imageWidth: 300,
                imageHeight: 230,
                title: "Minimize food waste",
                subtitle:
                    "Share leftovers with food banks,\nearn reward coins, and unlock exclusive perks!",
              ),
            ],
          ),
        ),
        bottomSheet: state.isLastPage
            ? Container(
                padding: EdgeInsets.only(bottom: 52.h, left: 34.w, right: 34.w),
                height: 170.h,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: ColorApp.primary,
                          dotColor: ColorApp.primary.withOpacity(0.30),
                          dotWidth: 12.w,
                          dotHeight: 12.h,
                        ),
                        onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 320.w,
                      height: 50.h,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(ColorApp.primary),
                        ),
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                          context.goNamed(Routes.login.name);
                        },
                        child: Text(
                          'Start Now',
                          style: TypographyApp.onBoardBtnText,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                padding: EdgeInsets.only(bottom: 52.h, left: 34.w, right: 34.w),
                height: 170.h,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          activeDotColor: ColorApp.primary,
                          dotColor: ColorApp.primary.withOpacity(0.30),
                          dotWidth: 12.w,
                          dotHeight: 12.h,
                        ),
                        onDotClicked: (index) => controller.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 120.w,
                          height: 50.h,
                          child: TextButton(
                            onPressed: () {
                              controller.jumpToPage(2);
                            },
                            child: Text(
                              'Skip',
                              style: TypographyApp.onBoardUnBtnText,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 120.w,
                          height: 50.h,
                          child: TextButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(ColorApp.primary),
                            ),
                            onPressed: () {
                              controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              'Next',
                              style: TypographyApp.onBoardBtnText,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
