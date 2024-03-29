import 'package:cached_network_image/cached_network_image.dart';
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
import 'package:geats/src/shared/extensions/extensions.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  CommonState get commonState => ref.watch(commonControllerProvider);
  AnalyzeState get analyzeState => ref.watch(analyzeControllerProvider);
  AnalyzeController get analyzeController =>
      ref.read(analyzeControllerProvider.notifier);

  List<String> articles = [
    'How To Get Started With Healthy Eating',
    'The Importance of Regular Exercise in Daily Life',
    'Top 10 Tips for Stress Management',
    'Exploring Different Meditation Techniques for Beginners',
    'Healthy Sleep Habits: A Guide to Better Sleep',
    'Balancing Work and Life: Strategies for a Productive Lifestyle',
  ];

  @override
  void initState() {
    safeRebuild(() {
      analyzeController.getDate();
      analyzeController.getDailyMeals(
          DateTime.now(), commonState.user?.dailyMeals);
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
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 0.h, bottom: 30.h),
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
                          getGreetingWidget(),
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
                      InkWell(
                        child: SizedBox(
                          width: 43.w,
                          child: const Icon(
                            Icons.notifications_none_outlined,
                            color: Colors.black,
                          ),
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
                      height: 205.h,
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 16.w, top: 14.h, bottom: 5.h),
                        child: AsyncValueWidget(
                            value: commonState.userValue,
                            data: (data) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 5.w, vertical: 14.h),
                                  child: AsyncValueWidget(
                                    value: analyzeState.dailyMealsValue,
                                    data: (dailyMeals) => Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Transform.scale(
                                              scale: 1.01,
                                              child: Stack(
                                                children: [
                                                  SizedBox(
                                                    height: 140,
                                                    width: 140,
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: (data!
                                                                  .caloriesGoal -
                                                              dailyMeals
                                                                  .totalCalories) /
                                                          (data.caloriesGoal ==
                                                                  0
                                                              ? 1
                                                              : data
                                                                  .caloriesGoal),
                                                      strokeWidth: 10,
                                                      backgroundColor:
                                                          HexColor('#85C2C6'),
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              HexColor(
                                                                  '#F8FAE5')),
                                                    ),
                                                  ),
                                                  Positioned.fill(
                                                    child: Center(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                              height: 35.h),
                                                          Text(
                                                            (data.caloriesGoal -
                                                                    dailyMeals
                                                                        .totalCalories)
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 30.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                          Text(
                                                            'Calorie left',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    12.sp),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30.w,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${dailyMeals.totalCalories.toString()} cal',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  width: 125.w,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15.r)),
                                                    child:
                                                        LinearProgressIndicator(
                                                      value: dailyMeals
                                                              .totalCalories /
                                                          (data.caloriesGoal ==
                                                                  0
                                                              ? 1
                                                              : data
                                                                  .caloriesGoal),
                                                      minHeight: 10.h,
                                                      backgroundColor:
                                                          HexColor('#85C2C6'),
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              HexColor(
                                                                  '#151515')),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Consumed',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color:
                                                          HexColor('#D3FFEC')),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${dailyMeals.totalFat.toString()} gr',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  width: 125.w,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15.r)),
                                                    child:
                                                        LinearProgressIndicator(
                                                      value: dailyMeals
                                                              .totalFat /
                                                          (data.fatGoal == 0
                                                              ? 1
                                                              : data.fatGoal),
                                                      minHeight: 10.h,
                                                      backgroundColor:
                                                          HexColor('#85C2C6'),
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              HexColor(
                                                                  '#B19470')),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Fat',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color:
                                                          HexColor('#D3FFEC')),
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${dailyMeals.totalProteins.toString()} gr',
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.white),
                                                ),
                                                SizedBox(
                                                  width: 125.w,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15.r)),
                                                    child:
                                                        LinearProgressIndicator(
                                                      value: dailyMeals
                                                              .totalProteins /
                                                          (data.proteinsGoal ==
                                                                  0
                                                              ? 1
                                                              : data
                                                                  .proteinsGoal),
                                                      minHeight: 10.h,
                                                      backgroundColor:
                                                          HexColor('#85C2C6'),
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              HexColor(
                                                                  '#FF9800')),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  'Protein',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color:
                                                          HexColor('#D3FFEC')),
                                                )
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )),
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
                  height: 210.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 10),
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
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: HexColor('#F1F5F5'),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.article,
                                    color: HexColor('#85B1B4'),
                                    size: 50.w,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                  width: 170.56.w,
                                  child: Text(
                                    articles[index],
                                    style: TextStyle(
                                        fontFamily: FontFamily.poppins,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
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
                                    ? CachedNetworkImage(
                                        width: 50.w,
                                        height: 50.w,
                                        imageUrl: e.image,
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
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

class GreetingsWidget extends StatelessWidget {
  final IconData iconData;
  final Color iconColor;
  final String greeting;

  const GreetingsWidget({
    super.key,
    required this.iconData,
    required this.iconColor,
    required this.greeting,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          color: iconColor,
        ),
        const SizedBox(width: 4),
        Text(
          greeting,
          style: TextStyle(
            fontFamily: FontFamily.poppins,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: iconColor,
          ),
        ),
      ],
    );
  }
}

Widget getGreetingWidget() {
  DateTime now = DateTime.now();
  int hour = now.hour;

  if (hour >= 6 && hour < 12) {
    // Morning
    return const GreetingsWidget(
      iconData: Icons.wb_sunny,
      iconColor: Colors.orange,
      greeting: 'Good Morning',
    );
  } else if (hour >= 12 && hour < 18) {
    // Afternoon
    return const GreetingsWidget(
      iconData: Icons.wb_cloudy,
      iconColor: Colors.blue,
      greeting: 'Good Afternoon',
    );
  } else {
    // Evening/Night
    return const GreetingsWidget(
      iconData: Icons.nightlight_outlined,
      iconColor: Colors.black,
      greeting: 'Good Evening',
    );
  }
}
