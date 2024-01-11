import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/gen/assets.gen.dart';
import 'package:geats/src/constants/constants.dart';

class OnboardingContent extends StatelessWidget {
  final AssetGenImage imageAsset;
  final double imageWidth;
  final double imageHeight;
  final String title;
  final String subtitle;

  const OnboardingContent({
    super.key,
    required this.imageAsset,
    required this.imageWidth,
    required this.imageHeight,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 230.h),
      child: Column(
        children: [
          Center(
            child: imageAsset.image(
              width: imageWidth.w,
              height: imageHeight.h,
            ),
          ),
          SizedBox(
            height: 13.46.h,
          ),
          Text(
            title,
            style: TypographyApp.onBoardTitle,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            subtitle,
            style: TypographyApp.onBoardSubTitle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
