import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/gen/fonts.gen.dart';
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 60.h,
            ),
            Text(
              'Recycle',
              style: TypographyApp.profileItem,
            ),
            SizedBox(
              height: 16.h,
            ),
            Card(
                color: ColorApp.primary,
                child: SizedBox(
                  width: 350,
                  height: 170,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 20.h, right: 8.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Let's Save Our Earth!",
                              style: TextStyle(
                                color: HexColor("#D3FFEC"),
                                fontFamily: FontFamily.poppins,
                                fontWeight: FontWeight.w500,
                                fontSize: ScreenUtil().setSp(16),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            SizedBox(
                              width: 170.w,
                              child: Text(
                                "save the earth by caring about food waste",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: FontFamily.poppins,
                                  fontWeight: FontWeight.w300,
                                  fontSize: ScreenUtil().setSp(12),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/icons/ic_dollar.png',
                                    ),
                                    Text(
                                      '60',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: ScreenUtil().setSp(20),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                    Gap.w4,
                                    Text(
                                      'Coins',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: ScreenUtil().setSp(16),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      '3',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: ScreenUtil().setSp(20),
                                      ),
                                    ),
                                    Gap.w4,
                                    Text(
                                      'Total Delivery',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: FontFamily.poppins,
                                        fontWeight: FontWeight.w500,
                                        fontSize: ScreenUtil().setSp(16),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Center(
                          child: Image.asset(
                            'assets/images/recycle_card.png',
                            width: 150,
                            height: 163,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
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
