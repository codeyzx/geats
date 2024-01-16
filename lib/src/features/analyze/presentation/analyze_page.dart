import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/gen/fonts.gen.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/routes/app_routes.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class AnalyzePage extends StatefulWidget {
  const AnalyzePage({super.key});

  @override
  State<AnalyzePage> createState() => _AnalyzePageState();
}

class _AnalyzePageState extends State<AnalyzePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                  'Wed, 9 Jan 2024',
                  style: TypographyApp.analyzeDateTitle,
                )
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 75.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  onTap: () {},
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
                          '04',
                          style: TypographyApp.analyzeDateNum,
                        ),
                        Text(
                          'Jan',
                          style: TypographyApp.analyzeDateMonth,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
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
                          '04',
                          style: TypographyApp.analyzeDateNum,
                        ),
                        Text(
                          'Jan',
                          style: TypographyApp.analyzeDateMonth,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
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
                          '04',
                          style: TypographyApp.analyzeDateNum,
                        ),
                        Text(
                          'Jan',
                          style: TypographyApp.analyzeDateMonth,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
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
                          '04',
                          style: TypographyApp.analyzeDateNum,
                        ),
                        Text(
                          'Jan',
                          style: TypographyApp.analyzeDateMonth,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
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
                          '04',
                          style: TypographyApp.analyzeDateNum,
                        ),
                        Text(
                          'Jan',
                          style: TypographyApp.analyzeDateMonth,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
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
                          '04',
                          style: TypographyApp.analyzeDateNum,
                        ),
                        Text(
                          'Jan',
                          style: TypographyApp.analyzeDateMonth,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
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
                          '05',
                          style: TypographyApp.analyzeDateNumActive,
                        ),
                        Text(
                          'Jan',
                          style: TypographyApp.analyzeDateMonthActive,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 21.h,
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 13.h),
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
                            '1.539',
                            style: TypographyApp.analyzeConsumedCurrent,
                          ),
                          SizedBox(
                            width: 4.h,
                          ),
                          Text(
                            '/ 2.575 Cal',
                            style: TypographyApp.analyzeConsumedMax,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        child: LinearProgressIndicator(
                          value: 1539 / 2575,
                          minHeight: 10.h,
                          backgroundColor: HexColor('#85C2C6'),
                          valueColor: AlwaysStoppedAnimation<Color>(
                              HexColor('#F8FAE5')),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
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
                                value: 75 / 90,
                                strokeWidth: 5,
                                backgroundColor: HexColor('#85C2C6'),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    HexColor('#F8FAE5')),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Protein',
                                style: TypographyApp.analyzeNutritionTitle,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '75',
                                    style: TypographyApp.analyzeConsumedCurrent,
                                  ),
                                  SizedBox(
                                    width: 4.h,
                                  ),
                                  Text(
                                    '/ 90gr',
                                    style: TypographyApp.analyzeConsumedMax,
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
                                value: 150 / 300,
                                strokeWidth: 5,
                                backgroundColor: HexColor('#85C2C6'),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    HexColor('#B19470')),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Carb',
                                style: TypographyApp.analyzeNutritionTitle,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '150',
                                    style: TypographyApp.analyzeConsumedCurrent,
                                  ),
                                  SizedBox(
                                    width: 4.h,
                                  ),
                                  Text(
                                    '/ 300gr',
                                    style: TypographyApp.analyzeConsumedMax,
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
                SizedBox(
                  height: 15.h,
                ),
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
                                value: 7.5 / 15,
                                strokeWidth: 5,
                                backgroundColor: HexColor('#85C2C6'),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    HexColor('#F1EB90')),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Protein',
                                style: TypographyApp.analyzeNutritionTitle,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '7,5',
                                    style: TypographyApp.analyzeConsumedCurrent,
                                  ),
                                  SizedBox(
                                    width: 4.h,
                                  ),
                                  Text(
                                    '/ 15gr',
                                    style: TypographyApp.analyzeConsumedMax,
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
                                value: 34 / 50,
                                strokeWidth: 5,
                                backgroundColor: HexColor('#85C2C6'),
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    HexColor('#008698')),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sugar',
                                style: TypographyApp.analyzeNutritionTitle,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '34',
                                    style: TypographyApp.analyzeConsumedCurrent,
                                  ),
                                  SizedBox(
                                    width: 4.h,
                                  ),
                                  Text(
                                    '/ 50gr',
                                    style: TypographyApp.analyzeConsumedMax,
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
                SizedBox(
                  height: 15.h,
                ),
                SizedBox(
                  width: 345.w,
                  height: 55.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 4,
                      backgroundColor: HexColor('#353535'),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13.r), // Atur border radius
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_rounded, color: Colors.white,),
                        SizedBox(width: 5.w,),
                        Text('ADD MEAL', style: TypographyApp.analyzeAddBtn,),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Recent Meal',
                  style: TypographyApp.analyzeDateTitle,
                ),

                ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Banana', style: TypographyApp.analyzeMealName,),
                                      Text('1 Qty', style: TypographyApp.analyzeMealQty,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('90', style: TypographyApp.analyzeMealNum,),
                                      Text('cal', style: TypographyApp.analyzeMealNumSub,),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Banana', style: TypographyApp.analyzeMealName,),
                                      Text('1 Qty', style: TypographyApp.analyzeMealQty,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('90', style: TypographyApp.analyzeMealNum,),
                                      Text('cal', style: TypographyApp.analyzeMealNumSub,),
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Banana', style: TypographyApp.analyzeMealName,),
                                      Text('1 Qty', style: TypographyApp.analyzeMealQty,),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text('90', style: TypographyApp.analyzeMealNum,),
                                      Text('cal', style: TypographyApp.analyzeMealNumSub,),
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
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
