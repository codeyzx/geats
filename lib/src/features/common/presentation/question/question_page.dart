import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/auth/domain/user.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
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
                    children: WeightGoal.values
                        .map(
                          (e) => Column(
                            children: [
                              Gap.h16,
                              QuestionButtonForm(
                                  isActivity: false,
                                  choice: e.value,
                                  controller: controllerState,
                                  state: state),
                            ],
                          ),
                        )
                        .toList(),
                  )),
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
                  )),
              QuestionContent(
                  imageAsset: 'assets/images/question_img_2.png',
                  imageWidth: 375,
                  imageHeight: 281,
                  title: 'How is Your Activity?',
                  child: Column(
                    children: Activity.values
                        .map(
                          (e) => Column(
                            children: [
                              Gap.h16,
                              QuestionButtonForm(
                                  isActivity: true,
                                  choice: e.value,
                                  controller: controllerState,
                                  state: state),
                            ],
                          ),
                        )
                        .toList(),
                  )),
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
                        onPressed: () async {
                          if (controllerState.heightController.text.isEmpty ||
                              controllerState.weightController.text.isEmpty) {
                            hideSnackBar(context);
                            appSnackBar(
                                context, Colors.red, 'Field do not empty');
                          } else {
                            final resultCalculate =
                                controllerState.calculateDiet(
                              gender: state.gender,
                              weight: double.parse(
                                  controllerState.weightController.text),
                              height: double.parse(
                                  controllerState.heightController.text),
                              age: int.tryParse(state.age) ?? 0,
                              weightGoal: state.weightGoal!,
                              activity: state.activity!,
                            );
                            resultCalculate['id'] = FirebaseAuth
                                .instance.currentUser!.uid
                                .toString();

                            resultCalculate['isSuccessRegister'] = true;

                            await controllerState.updateDiet(resultCalculate);

                            await controllerState.getProfile();

                            Future.delayed(const Duration(seconds: 1)).then(
                                (value) =>
                                    context.goNamed(Routes.botNavBar.name));
                          }
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
