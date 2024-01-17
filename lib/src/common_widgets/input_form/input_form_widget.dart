import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/shared/extensions/extensions.dart';

enum InputFormType {
  normal,
  password,
  button,
}

class InputFormWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Function(String value)? onChanged;
  final bool isObscure;
  final IconData? prefixIcon;
  final Function()? onObscureTap;
  final InputFormType inputFormType;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? errorText;
  final String? Function(String?)? validator;
  final bool? isHeight;
  final bool? isWeight;

  const InputFormWidget({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
    this.errorText,
    this.validator,
    this.isHeight,
    this.isWeight,
  })  : inputFormType = InputFormType.normal,
        isObscure = false,
        readOnly = false,
        onTap = null,
        onObscureTap = null;

  const InputFormWidget.button({
    super.key,
    required this.controller,
    required this.hintText,
    this.onTap,
    this.errorText,
    this.validator,
  })  : inputFormType = InputFormType.button,
        prefixIcon = null,
        isObscure = false,
        readOnly = true,
        onChanged = null,
        isHeight = null,
        isWeight = null,
        onObscureTap = null;

  const InputFormWidget.password({
    super.key,
    required this.controller,
    required this.hintText,
    required this.prefixIcon,
    this.onChanged,
    this.isObscure = true,
    this.onObscureTap,
    this.errorText,
    this.validator,
  })  : inputFormType = InputFormType.password,
        readOnly = false,
        isHeight = null,
        isWeight = null,
        onTap = null;

  bool get isPassword => inputFormType == InputFormType.password;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: isObscure,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      style: TypographyApp.loginOnInput,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
        errorText: errorText,
        hintText: hintText,
        hintStyle: TypographyApp.loginOffInput,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(
            color: ColorApp.secondary.withOpacity(0.4),
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: ColorApp.primary,
            width: 2.w,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: ColorApp.red,
            width: 2.w,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.r),
          borderSide: BorderSide(
            color: ColorApp.red,
            width: 2.w,
          ),
        ),
        prefixIcon: prefixIcon.isNotNull() ? Icon(prefixIcon) : null,
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: onObscureTap,
                child: Icon(
                  !isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: 23,
                  color: HexColor('#9D9D9D'),
                ),
              )
            : isHeight != null
                ? Container(
                    height: 53.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: ColorApp.primary,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(7.r),
                        bottomRight: Radius.circular(7.r),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'CM',
                        style: TypographyApp.text1.copyWith(
                          color: ColorApp.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                : isWeight != null
                    ? Container(
                        height: 53.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          color: ColorApp.primary,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(7.r),
                            bottomRight: Radius.circular(7.r),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'KG',
                            style: TypographyApp.text1.copyWith(
                              color: ColorApp.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
      ),
      readOnly: readOnly,
      onTap: onTap,
    );
  }
}
