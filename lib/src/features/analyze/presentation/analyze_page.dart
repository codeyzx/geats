import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/common_widgets/async_value/async_value_widget.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/analyze/presentation/analyze_controller.dart';
import 'package:geats/src/features/analyze/presentation/analyze_state.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/common_state.dart';
import 'package:geats/src/shared/extensions/extensions.dart';
import 'package:hexcolor/hexcolor.dart';

class AnalyzePage extends ConsumerStatefulWidget {
  const AnalyzePage({super.key});

  @override
  ConsumerState<AnalyzePage> createState() => _AnalyzePageState();
}

class _AnalyzePageState extends ConsumerState<AnalyzePage> {
  CommonState get commonState => ref.watch(commonControllerProvider);
  CommonController get commonController =>
      ref.read(commonControllerProvider.notifier);
  AnalyzeController get analyzeController =>
      ref.read(analyzeControllerProvider.notifier);
  AnalyzeState get analyzeState => ref.watch(analyzeControllerProvider);

  final ScrollController _scrollController = ScrollController(
    initialScrollOffset: (9) * (30),
  );

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 21.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 52.h,
                  ),
                  Text(
                    'Diet Analyze',
                    style: TypographyApp.analyzeTitle,
                  ),
                  Text(
                    DateTime.now().dateWithDayMonthYear,
                    style: TypographyApp.analyzeDateTitle,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            AsyncValueWidget(
              value: analyzeState.dateValue,
              data: (data) => SizedBox(
                height: 75.h,
                child: ListView(
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    children: data.map((e) {
                      return (analyzeState.selectedDate?.toYyyyMMDd ==
                              e.toYyyyMMDd)
                          ? InkWell(
                              onTap: () {
                                analyzeController.getDailyMeals(
                                    e, commonState.user?.dailyMeals);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 7.5.w),
                                width: 45.w,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: HexColor('#85B1B4'),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e.day.toString(),
                                      style: TypographyApp.analyzeDateNumActive,
                                    ),
                                    Text(
                                      e.monthNameShort,
                                      style:
                                          TypographyApp.analyzeDateMonthActive,
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : InkWell(
                              onTap: () {
                                analyzeController.getDailyMeals(
                                    e, commonState.user?.dailyMeals);
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 7.5.w),
                                width: 45.w,
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                decoration: BoxDecoration(
                                  color: HexColor('#F1F5F5'),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e.day.toString(),
                                      style: TypographyApp.analyzeDateNum,
                                    ),
                                    Text(
                                      e.monthNameShort,
                                      style: TypographyApp.analyzeDateMonth,
                                    ),
                                  ],
                                ),
                              ),
                            );
                    }).toList()),
              ),
            ),
            AsyncValueWidget(
              value: commonState.userValue,
              data: (data) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 21.h,
                    ),
                    AsyncValueWidget(
                      value: analyzeState.dailyMealsValue,
                      data: (dailyMeals) => Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 13.h),
                            width: 345.w,
                            decoration: BoxDecoration(
                              color: HexColor('#85B1B4'),
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Consumed Today',
                                  style: TypographyApp.analyzeConsumed,
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      dailyMeals.totalCalories.toString(),
                                      style:
                                          TypographyApp.analyzeConsumedCurrent,
                                    ),
                                    SizedBox(
                                      width: 4.h,
                                    ),
                                    Text(
                                      '/ ${data?.caloriesGoal} cal',
                                      style: TypographyApp.analyzeConsumedMax,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 6.h,
                                ),
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r)),
                                  child: LinearProgressIndicator(
                                    value: dailyMeals.totalCalories /
                                        (data!.caloriesGoal == 0
                                            ? 1
                                            : data.caloriesGoal),
                                    minHeight: 10.h,
                                    backgroundColor: HexColor('#85C2C6'),
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        HexColor('#F8FAE5')),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Gap.h16,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 16.h),
                                width: 163.w,
                                decoration: BoxDecoration(
                                  color: HexColor('#85B1B4'),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Transform.scale(
                                      scale: 1.01,
                                      child: SizedBox(
                                        height: 48.0,
                                        width: 48.0,
                                        child: CircularProgressIndicator(
                                          value: dailyMeals.totalProteins /
                                              (data.proteinsGoal == 0
                                                  ? 1
                                                  : data.proteinsGoal),
                                          strokeWidth: 5,
                                          backgroundColor: HexColor('#85C2C6'),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  HexColor('#F8FAE5')),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Protein',
                                          style: TypographyApp
                                              .analyzeNutritionTitle,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              dailyMeals.totalProteins
                                                  .toString(),
                                              style: TypographyApp
                                                  .analyzeConsumedCurrent,
                                            ),
                                            SizedBox(
                                              width: 4.h,
                                            ),
                                            Text(
                                              '/ ${data.proteinsGoal}gr',
                                              style: TypographyApp
                                                  .analyzeConsumedMax,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 16.h),
                                width: 163.w,
                                decoration: BoxDecoration(
                                  color: HexColor('#85B1B4'),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Transform.scale(
                                      scale: 1.01,
                                      child: SizedBox(
                                        height: 48.0,
                                        width: 48.0,
                                        child: CircularProgressIndicator(
                                          value: dailyMeals.totalCarbs /
                                              (data.carbsGoal == 0
                                                  ? 1
                                                  : data.carbsGoal),
                                          strokeWidth: 5,
                                          backgroundColor: HexColor('#85C2C6'),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  HexColor('#B19470')),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Carb',
                                          style: TypographyApp
                                              .analyzeNutritionTitle,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              dailyMeals.totalCarbs.toString(),
                                              style: TypographyApp
                                                  .analyzeConsumedCurrent,
                                            ),
                                            SizedBox(
                                              width: 4.h,
                                            ),
                                            Text(
                                              '/ ${data.carbsGoal}gr',
                                              style: TypographyApp
                                                  .analyzeConsumedMax,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Gap.h16,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 16.h),
                                width: 163.w,
                                decoration: BoxDecoration(
                                  color: HexColor('#85B1B4'),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Transform.scale(
                                      scale: 1.01,
                                      child: SizedBox(
                                        height: 48.0,
                                        width: 48.0,
                                        child: CircularProgressIndicator(
                                          value: dailyMeals.totalFat /
                                              (data.fatGoal == 0
                                                  ? 1
                                                  : data.fatGoal),
                                          strokeWidth: 5,
                                          backgroundColor: HexColor('#85C2C6'),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  HexColor('#F1EB90')),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Fat',
                                          style: TypographyApp
                                              .analyzeNutritionTitle,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              dailyMeals.totalFat.toString(),
                                              style: TypographyApp
                                                  .analyzeConsumedCurrent,
                                            ),
                                            SizedBox(
                                              width: 4.h,
                                            ),
                                            Text(
                                              '/ ${data.fatGoal}gr',
                                              style: TypographyApp
                                                  .analyzeConsumedMax,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12.w, vertical: 16.h),
                                width: 163.w,
                                decoration: BoxDecoration(
                                  color: HexColor('#85B1B4'),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Transform.scale(
                                      scale: 1.01,
                                      child: SizedBox(
                                        height: 48.0,
                                        width: 48.0,
                                        child: CircularProgressIndicator(
                                          value: dailyMeals.totalSugars /
                                              (data.sugarsGoal == 0
                                                  ? 1
                                                  : data.sugarsGoal),
                                          strokeWidth: 5,
                                          backgroundColor: HexColor('#85C2C6'),
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  HexColor('#008698')),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 12.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Sugar',
                                          style: TypographyApp
                                              .analyzeNutritionTitle,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              dailyMeals.totalSugars.toString(),
                                              style: TypographyApp
                                                  .analyzeConsumedCurrent,
                                            ),
                                            SizedBox(
                                              width: 4.h,
                                            ),
                                            Text(
                                              '/ ${data.sugarsGoal}gr',
                                              style: TypographyApp
                                                  .analyzeConsumedMax,
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gap.h16,
                    SizedBox(
                      width: 345.w,
                      height: 55.h,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 4,
                          backgroundColor: HexColor('#353535'),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                13.r), // Atur border radius
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.add_rounded,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'ADD MEAL',
                              style: TypographyApp.analyzeAddBtn,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Gap.h16,
                    Text(
                      'Recent Meal',
                      style: TypographyApp.analyzeDateTitle,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: 50.w,
                                      height: 50.h,
                                      color: Colors.black,
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
          ],
        ),
      ),
    );
  }
}
