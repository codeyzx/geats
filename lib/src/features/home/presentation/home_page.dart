import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/gen/fonts.gen.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/analyze/presentation/analyze_controller.dart';
import 'package:geats/src/features/analyze/presentation/analyze_state.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/common_state.dart';
import 'package:geats/src/features/home/presentation/home_controller.dart';
import 'package:geats/src/features/home/presentation/home_state.dart';
import 'package:geats/src/shared/extensions/extensions.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  HomeController get controller => ref.read(homeControllerProvider.notifier);
  HomeState get state => ref.watch(homeControllerProvider);
  // CheckupController get checkupController =>
  //     ref.read(checkupControllerProvider.notifier);
  // CheckupState get checkupState => ref.watch(checkupControllerProvider);
  CommonState get commonState => ref.watch(commonControllerProvider);
  AnalyzeState get analyzeState => ref.watch(analyzeControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      // controller.fetchHome(
      //   '${commonState.user?.id}',
      //   DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
      //   DateTime.now().add(const Duration(days: 1)),
      // );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatusBarWidget(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 52.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.nightlight_outlined,
                                color: Colors.black,
                              ),
                              Gap.w4,
                              Text('Good Night',
                                  style: TextStyle(
                                      fontFamily: FontFamily.poppins,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ],
                          ),
                          Gap.h4,
                          Text(
                            commonState.user!.name,
                            style: TextStyle(
                                fontFamily: FontFamily.poppins,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 43.w,
                        child: const Icon(
                          Icons.notifications_none_outlined,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Card(
                    color: ColorApp.primary,
                    child: SizedBox(
                      height: 192.h,
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 10.w, top: 25.h, bottom: 9.h),
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [],
                        ),
                      ),
                    )),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Articles",
                        style: TypographyApp.recycleTitle,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'See All',
                              style: TypographyApp.recycleCardSeeAll,
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: HexColor('#747688'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 240.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18.r),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor('#505588').withOpacity(0.06),
                                  offset: const Offset(0, 8),
                                  blurRadius: 30,
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 170.56.w,
                                height: 110.h,
                                padding: EdgeInsets.only(
                                    top: 7.h,
                                    left: 7.w,
                                    right: 128.w,
                                    bottom: 57.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: const DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7effe0c9-16a3-4e45-b4df-73fd25b34b87/dg80etl-dbb6b229-a693-443c-906c-71a1d8ce5add.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzdlZmZlMGM5LTE2YTMtNGU0NS1iNGRmLTczZmQyNWIzNGI4N1wvZGc4MGV0bC1kYmI2YjIyOS1hNjkzLTQ0M2MtOTA2Yy03MWExZDhjZTVhZGQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VASt7CgMX_QFTqknwi4S7vA0GCZg3vc0fapN_89g5Ws'))),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                  width: 170.56.w,
                                  child: Text(
                                    'International Band Musician',
                                    style: TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18.r),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor('#505588').withOpacity(0.06),
                                  offset: const Offset(0, 8),
                                  blurRadius: 30,
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 170.56.w,
                                height: 110.h,
                                padding: EdgeInsets.only(
                                    top: 7.h,
                                    left: 7.w,
                                    right: 128.w,
                                    bottom: 57.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: const DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7effe0c9-16a3-4e45-b4df-73fd25b34b87/dg80etl-dbb6b229-a693-443c-906c-71a1d8ce5add.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzdlZmZlMGM5LTE2YTMtNGU0NS1iNGRmLTczZmQyNWIzNGI4N1wvZGc4MGV0bC1kYmI2YjIyOS1hNjkzLTQ0M2MtOTA2Yy03MWExZDhjZTVhZGQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VASt7CgMX_QFTqknwi4S7vA0GCZg3vc0fapN_89g5Ws'))),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                  width: 170.56.w,
                                  child: Text(
                                    'International Band Musician',
                                    style: TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.w, vertical: 7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18.r),
                              boxShadow: [
                                BoxShadow(
                                  color: HexColor('#505588').withOpacity(0.06),
                                  offset: const Offset(0, 8),
                                  blurRadius: 30,
                                ),
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 170.56.w,
                                height: 110.h,
                                padding: EdgeInsets.only(
                                    top: 7.h,
                                    left: 7.w,
                                    right: 128.w,
                                    bottom: 57.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: const DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                            'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7effe0c9-16a3-4e45-b4df-73fd25b34b87/dg80etl-dbb6b229-a693-443c-906c-71a1d8ce5add.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzdlZmZlMGM5LTE2YTMtNGU0NS1iNGRmLTczZmQyNWIzNGI4N1wvZGc4MGV0bC1kYmI2YjIyOS1hNjkzLTQ0M2MtOTA2Yy03MWExZDhjZTVhZGQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VASt7CgMX_QFTqknwi4S7vA0GCZg3vc0fapN_89g5Ws'))),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              SizedBox(
                                  width: 170.56.w,
                                  child: Text(
                                    'International Band Musician',
                                    style: TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Recent Meal",
                        style: TypographyApp.recycleTitle,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text(
                              'See All',
                              style: TypographyApp.recycleCardSeeAll,
                            ),
                            Icon(
                              Icons.arrow_right,
                              color: HexColor('#747688'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                analyzeState.todayMeals.isNotEmpty
                    ? ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: analyzeState.todayMeals.map((e) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 15.0.h),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                e.image.isNotEmpty
                                    ? Container(
                                        width: 50.w,
                                        height: 50.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          image: DecorationImage(
                                            image: NetworkImage(e.image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width: 50.w,
                                        height: 50.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                          color: HexColor('#F1F5F5'),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.fastfood_rounded,
                                            color: HexColor('#85B1B4'),
                                          ),
                                        ),
                                      ),
                                Column(
                                  children: [
                                    SizedBox(
                                      width: 271.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                e.name,
                                                style: TypographyApp
                                                    .analyzeMealName,
                                              ),
                                              Text(
                                                '${e.qty} Qty',
                                                style: TypographyApp
                                                    .analyzeMealQty,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                e.calories.toString(),
                                                style: TypographyApp
                                                    .analyzeMealNum,
                                              ),
                                              Text(
                                                'cal',
                                                style: TypographyApp
                                                    .analyzeMealNumSub,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      width: 271.w,
                                      height: 1.h,
                                      color: HexColor('#A9A9A9'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      )
                    : SizedBox(
                        height: 150.h,
                        child: Center(
                          child: Text(
                            'You haven\'t eaten anything today',
                            style: TypographyApp.analyzeDateMonth.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
