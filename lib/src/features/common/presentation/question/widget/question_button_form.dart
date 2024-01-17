import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/common_state.dart';
import 'package:hexcolor/hexcolor.dart';

class QuestionButtonForm extends ConsumerWidget {
  final String choice;
  final bool isActivity;
  final CommonController controller;
  final CommonState state;

  const QuestionButtonForm({
    super.key,
    required this.choice,
    required this.isActivity,
    required this.controller,
    required this.state,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.r),
        color: isActivity
            ? choice == state.activity?.value
                ? ColorApp.primary
                : ColorApp.primary.withOpacity(0.15)
            : choice == state.weightGoal?.value
                ? ColorApp.primary
                : ColorApp.primary.withOpacity(0.15),
      ),
      width: 263.w,
      height: 60.h,
      child: InkWell(
        onTap: () {
          if (isActivity) {
            controller.setActivity(choice);
          } else {
            controller.setWeightGoal(choice);
          }
        },
        child: Center(
          child: Text(
            choice,
            style: isActivity
                ? choice == state.activity?.value
                    ? TypographyApp.whiteOnBtnSmall
                    : TypographyApp.whiteOnBtnSmall.copyWith(
                        color: HexColor('#949494'),
                        fontWeight: FontWeight.w300,
                      )
                : choice == state.weightGoal?.value
                    ? TypographyApp.whiteOnBtnSmall
                    : TypographyApp.whiteOnBtnSmall.copyWith(
                        color: HexColor('#949494'),
                        fontWeight: FontWeight.w300,
                      ),
          ),
        ),
      ),
    );
  }
}
