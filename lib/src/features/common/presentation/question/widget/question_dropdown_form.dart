import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/gen/fonts.gen.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/common_state.dart';

class QuestionDropDownForm extends ConsumerWidget {

  const QuestionDropDownForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(commonControllerProvider);
    final controllerState = ref.read(commonControllerProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputDecorator(
          decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.person_2_rounded 
                ),
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(
                color: ColorApp.secondary,
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: SizedBox(
              height: 18,
              child: DropdownButton(
                isExpanded: true,
                value: state.gender,
                  style: TypographyApp.text1,
                  isDense: true,
                  onChanged: controllerState.setGender,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded
                  ),
                  items: gender.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                      e,
                      style: TextStyle(
                        color: ColorApp.secondary,
                        fontFamily: FontFamily.poppins
                      ),
                    ),
                  );
              }).toList()),
            ),
          ),
        ),
        Gap.h4,
        InputDecorator(
          decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.add_reaction_rounded,
                ),
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.r),
                borderSide: BorderSide(
                color: ColorApp.primary,
                width: 0.5.w,
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: SizedBox(
              height: 18,
              child: DropdownButton(
                value: state.age,
                  style: TypographyApp.text1,
                  isDense: true,
                  menuMaxHeight: 100.h,
                  icon: const Icon(
                    Icons.keyboard_arrow_down_rounded
                  ),
                  onChanged: controllerState.setAge,
                  items: age.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(
                      e,
                      style: TextStyle(
                        color: ColorApp.secondary,
                        fontFamily: FontFamily.poppins
                      ),
                    ),
                  );
              }).toList()),
            ),
          ),
        ),
        Gap.h4
      ],
    );
  }
}