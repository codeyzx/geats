import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/shared/extensions/extensions.dart';

class DropdownFormWidget extends StatelessWidget {
  final String value;
  final List<Map<String, String>> list;
  final Function(String? value) onChanged;
  final IconData? prefixIcon;
  final String? errorText;

  const DropdownFormWidget({
    super.key,
    required this.value,
    required this.prefixIcon,
    required this.onChanged,
    required this.list,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeApp.h52,
      child: InputDecorator(
        decoration: InputDecoration(
          errorText: errorText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide(
              color: ColorApp.secondary.withOpacity(0.4),
              width: 1.w,
            ),
          ),
          prefixIcon: prefixIcon.isNotNull() ? Icon(prefixIcon) : null,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: value,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 26,
              color: Colors.grey.shade400,
            ),
            style: TypographyApp.text1.copyWith(
              color: ColorApp.secondary.withOpacity(0.9),
              fontWeight: FontWeight.w600,
            ),
            isExpanded: true,
            borderRadius: BorderRadius.circular(12.r),
            onChanged: (String? newValue) {
              onChanged(newValue);
            },
            items: list.map<DropdownMenuItem<String>>((value) {
              return DropdownMenuItem<String>(
                value: value['value'],
                child: Text(value['text'] ?? value['value']!),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
