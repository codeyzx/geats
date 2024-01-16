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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 52.h,
              ),
              Text(
                'Recycle',
                style: TypographyApp.recycleTitle,
              ),
              SizedBox(
                height: 9.h,
              ),
              Card(
                  color: ColorApp.primary,
                  child: SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.w, top: 25.h, bottom: 9.h),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Let's Save Our Earth!",
                                style: TypographyApp.recycleCardTitle
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              SizedBox(
                                width: 170.w,
                                child: Text(
                                  "save the earth by caring about food waste",
                                  style: TypographyApp.recycleCardSubTitle,
                                ),
                              ),
                              SizedBox(height: 8.h,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/icons/ic_dollar.png',
                                      ),
                                      SizedBox(width: 6.w,),
                                      Text(
                                        '60',
                                        style: TypographyApp.recycleCardValue,
                                        textAlign: TextAlign.left,
                                      ),
                                      Gap.w4,
                                      Text(
                                        'Coins',
                                        style: TypographyApp.recycleCardValueSub,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        '3',
                                        style: TypographyApp.recycleCardValue,
                                      ),
                                      Gap.w4,
                                      Text(
                                        'Total Delivery',
                                        style: TypographyApp.recycleCardValueSub
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
                              width: 150.w,
                              height: 163.h,
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
              SizedBox(
                height: 16.h,
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
                      Text('RECYCLE NOW', style: TypographyApp.analyzeAddBtn,),
                    ],
                  ),
                ),
              ),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       context.pushNamed(Routes.recycle.name);
              //     },
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.black,
              //       minimumSize: Size(0.8.sw, 48.h),
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(12.r),
              //       ),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         const Icon(
              //           Icons.add,
              //           color: Colors.white,
              //         ),
              //         Text(
              //           'RECYCLE NOW',
              //           style: TypographyApp.whiteOnBtnSmall,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recent Deliver",
                    style: TypographyApp.recycleTitle,
                  ),
                  InkWell(
                    onTap: (){},
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
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Column(
                    children: [
                      SizedBox(height: 8.h,),
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
                                        Text('1 kg', style: TypographyApp.analyzeMealQty,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('+ 20', style: TypographyApp.analyzeMealNum,),
                                        Text(' Coins', style: TypographyApp.analyzeMealNumSub,),
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
                  Column(
                    children: [
                      SizedBox(height: 8.h,),
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
                                        Text('1 kg', style: TypographyApp.analyzeMealQty,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('+ 20', style: TypographyApp.analyzeMealNum,),
                                        Text(' Coins', style: TypographyApp.analyzeMealNumSub,),
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
                  Column(
                    children: [
                      SizedBox(height: 8.h,),
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
                                        Text('1 kg', style: TypographyApp.analyzeMealQty,),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text('+ 20', style: TypographyApp.analyzeMealNum,),
                                        Text(' Coins', style: TypographyApp.analyzeMealNumSub,),
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
              SizedBox(height: 25.h,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product on Sale",
                    style: TypographyApp.recycleTitle,
                  ),
                  InkWell(
                    onTap: (){},
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
              Container(
                height: 160.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18.r),
                          boxShadow: [
                            BoxShadow(
                              color: HexColor('#505588').withOpacity(0.06),
                              offset: Offset(0, 8),
                              blurRadius: 30,
                            ),
                          ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 170.56.w,
                              height: 110.h,
                              padding: EdgeInsets.only(top: 7.h, left: 7.w, right: 128.w, bottom: 57.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                    image: NetworkImage('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7effe0c9-16a3-4e45-b4df-73fd25b34b87/dg80etl-dbb6b229-a693-443c-906c-71a1d8ce5add.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzdlZmZlMGM5LTE2YTMtNGU0NS1iNGRmLTczZmQyNWIzNGI4N1wvZGc4MGV0bC1kYmI2YjIyOS1hNjkzLTQ0M2MtOTA2Yy03MWExZDhjZTVhZGQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VASt7CgMX_QFTqknwi4S7vA0GCZg3vc0fapN_89g5Ws'))
                              ),
                              child: Container(
                                width: 35.21.w,
                                height: 36.52.h,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.70),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('280', style: TypographyApp.recycleSaleValue,),
                                    Text('COINS', style: TypographyApp.recycleSaleValueSub,),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            SizedBox(
                                width: 170.56.w,
                                child: Text('Voucher Belanja 25RB', style: TypographyApp.recycleSaleTitle, overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.r),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor('#505588').withOpacity(0.06),
                                offset: Offset(0, 8),
                                blurRadius: 30,
                              ),
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 170.56.w,
                              height: 110.h,
                              padding: EdgeInsets.only(top: 7.h, left: 7.w, right: 128.w, bottom: 57.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7effe0c9-16a3-4e45-b4df-73fd25b34b87/dg80etl-dbb6b229-a693-443c-906c-71a1d8ce5add.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzdlZmZlMGM5LTE2YTMtNGU0NS1iNGRmLTczZmQyNWIzNGI4N1wvZGc4MGV0bC1kYmI2YjIyOS1hNjkzLTQ0M2MtOTA2Yy03MWExZDhjZTVhZGQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VASt7CgMX_QFTqknwi4S7vA0GCZg3vc0fapN_89g5Ws'))
                              ),
                              child: Container(
                                width: 35.21.w,
                                height: 36.52.h,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.70),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('280', style: TypographyApp.recycleSaleValue,),
                                    Text('COINS', style: TypographyApp.recycleSaleValueSub,),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            SizedBox(
                                width: 170.56.w,
                                child: Text('Voucher Belanja 25RB', style: TypographyApp.recycleSaleTitle, overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18.r),
                            boxShadow: [
                              BoxShadow(
                                color: HexColor('#505588').withOpacity(0.06),
                                offset: Offset(0, 8),
                                blurRadius: 30,
                              ),
                            ]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 170.56.w,
                              height: 110.h,
                              padding: EdgeInsets.only(top: 7.h, left: 7.w, right: 128.w, bottom: 57.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/7effe0c9-16a3-4e45-b4df-73fd25b34b87/dg80etl-dbb6b229-a693-443c-906c-71a1d8ce5add.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzdlZmZlMGM5LTE2YTMtNGU0NS1iNGRmLTczZmQyNWIzNGI4N1wvZGc4MGV0bC1kYmI2YjIyOS1hNjkzLTQ0M2MtOTA2Yy03MWExZDhjZTVhZGQuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.VASt7CgMX_QFTqknwi4S7vA0GCZg3vc0fapN_89g5Ws'))
                              ),
                              child: Container(
                                width: 35.21.w,
                                height: 36.52.h,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.70),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('280', style: TypographyApp.recycleSaleValue,),
                                    Text('COINS', style: TypographyApp.recycleSaleValueSub,),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h,),
                            SizedBox(
                                width: 170.56.w,
                                child: Text('Voucher Belanja 25RB', style: TypographyApp.recycleSaleTitle, overflow: TextOverflow.ellipsis,)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.h,)
            ],
          ),
        ),
      ),
    );
  }
}
