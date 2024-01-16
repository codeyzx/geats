import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/question/widget/question_button_form.dart';
import 'package:geats/src/features/common/presentation/question/widget/question_content.dart';
import 'package:geats/src/features/common/presentation/question/widget/question_dropdown_form.dart';
import 'package:geats/src/features/common/presentation/question/widget/widget.dart';
import 'package:geats/src/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class QuestionPage extends ConsumerWidget {
  const QuestionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commonControllerProvider);
    final controllerState = ref.read(commonControllerProvider.notifier);
    final controller = PageController();

    return StatusBarWidget(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(top: 5.h),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              controllerState.setLastPage(index == 2);
            },
            children: [
              QuestionContent(
                imageAsset: 'assets/images/question_img_3.png', 
                imageWidth: 375, 
                imageHeight: 281,
                title: 'Which is Your Preference?', 
                child: Column(
                  children: [
                    Gap.h12,
                    const QuestionButtonForm(choice: "Weight Gain"),
                    Gap.h12,
                    const QuestionButtonForm(choice: "Maintain Weight"),
                    Gap.h12,
                    const QuestionButtonForm(choice: "Weight Loss"),
                  ],
                )
              ),
              QuestionContent(
                imageAsset: 'assets/images/question_img_1.png', 
                imageWidth: 375, 
                imageHeight: 281, 
                title: 'Your Personal Information',
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: const Column(
                    children: [
                      QuestionDropDownForm(),
                      QuestionInputForm(),
                    ],
                  ),
                )
              ),
              QuestionContent(
                imageAsset: 'assets/images/question_img_2.png', 
                imageWidth: 375, 
                imageHeight: 281, 
                title: 'How is Your Activity?',
                child: Column(
                  children: [
                    Gap.h12,
                    const QuestionButtonForm(choice: "Little or no exersice"),
                    Gap.h12,
                    const QuestionButtonForm(choice: "2-3 exercise/weeks"),
                    Gap.h12,
                    const QuestionButtonForm(choice: "Very active"),
                  ],
                )
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
                          context.goNamed(Routes.botNavBar.name);
                        },
                        child: Text(
                          'Mulai',
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
                              controller.previousPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(
                              'Back',
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
