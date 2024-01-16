import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/constants/constants.dart';

class QuestionContent extends StatelessWidget{
  final String imageAsset;
  final double imageWidth;
  final double imageHeight;
  final String title;
  final Widget child;

  const QuestionContent({
    super.key,
    required this.imageAsset,
    required this.imageWidth,
    required this.imageHeight,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 60.h),
      child: Column(
        children: [
          Center(
            child: Image.asset(
              imageAsset, 
              width: imageWidth,
              height: imageHeight,
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
          child
        ]
      ),
    );
  }
}