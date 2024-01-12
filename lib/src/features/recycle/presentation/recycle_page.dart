import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class RecyclePage extends ConsumerWidget {
  const RecyclePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Text(
              'Recycle',
              style: TypographyApp.profileItem,
            ),
            SizedBox(
              height: 12.h,
            ),
            Card(
              color: ColorApp.primary,
              child: const SizedBox(
                width: 350,
                height: 200,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  context.pushNamed(Routes.recycle.name);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  minimumSize: Size(0.8.sw, 48.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    Text(
                      'RECYCLE NOW',
                      style: TypographyApp.whiteOnBtnSmall,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Deliver",
                  style: TypographyApp.profileItem,
                ),
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        'See All',
                        style: TypographyApp.profileItemTitle,
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: HexColor('#606060'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
