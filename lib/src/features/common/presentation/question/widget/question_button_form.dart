import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/constants/constants.dart';

class QuestionButtonForm extends ConsumerWidget {
  final String choice;

  const QuestionButtonForm({
    super.key,
    required this.choice,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.r),
            color: ColorApp.primary,
          ),
          width: 263.w,
          height: 53,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: ColorApp.primary,
            ),
            child: InkWell(
              onTap: () {

              },
              child: Center(
                child: Text(
                  choice,
                  style: TypographyApp.whiteOnBtnSmall,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
