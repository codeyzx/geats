import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/common_widgets/async_value/async_value_widget.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/common_state.dart';
import 'package:geats/src/features/recycle/presentation/recycle_controller.dart';
import 'package:geats/src/features/recycle/presentation/recycle_state.dart';
import 'package:geats/src/routes/app_routes.dart';
import 'package:geats/src/shared/extensions/extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class RecyclePage extends ConsumerStatefulWidget {
  const RecyclePage({super.key});

  @override
  ConsumerState<RecyclePage> createState() => _RecyclePageState();
}

class _RecyclePageState extends ConsumerState<RecyclePage> {
  CommonController get commonController =>
      ref.read(commonControllerProvider.notifier);
  CommonState get commonState => ref.watch(commonControllerProvider);
  RecycleController get recycleController =>
      ref.read(recycleControllerProvider.notifier);
  RecycleState get recycleState => ref.watch(recycleControllerProvider);
  List<String> products = [
    'Voucher Pulsa 25k',
    'Voucher Belanja 25k',
    'Mobile Data Package (10GB)',
    'Online Streaming Subscription (1 Month)',
    'Gaming Credits for In-App Purchases',
    'Digital Gift Card for Popular E-Store',
    'E-book Bundle: Bestselling Novels Collection',
    'Virtual Fitness Class Pass (1 Month)',
    'Online Language Learning Course Subscription',
    'Premium Software License Key',
    'Digital Art and Design Assets Pack',
    'Music Streaming Service Subscription (3 Months)',
  ];
  @override
  void initState() {
    safeRebuild(() {
      recycleController.getFoodbank();
      recycleController.getDeliver(commonState.user?.id ?? '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(left: 16.w, right: 16.w, top: 0.h, bottom: 30.h),
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
                      padding:
                          EdgeInsets.only(left: 10.w, top: 25.h, bottom: 9.h),
                      child: AsyncValueWidget(
                        value: recycleState.deliverValue,
                        data: (data) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Let's Save Our Earth!",
                                    style: TypographyApp.recycleCardTitle),
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
                                SizedBox(
                                  height: 8.h,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/icons/ic_dollar.png',
                                        ),
                                        SizedBox(
                                          width: 6.w,
                                        ),
                                        Text(
                                          '${commonState.user?.coins}',
                                          style: TypographyApp.recycleCardValue,
                                          textAlign: TextAlign.left,
                                        ),
                                        Gap.w4,
                                        Text(
                                          'Coins',
                                          style:
                                              TypographyApp.recycleCardValueSub,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${data.length}',
                                          style: TypographyApp.recycleCardValue,
                                        ),
                                        Gap.w4,
                                        Text('Total Delivery',
                                            style: TypographyApp
                                                .recycleCardValueSub),
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
                    ),
                  )),
              SizedBox(
                height: 16.h,
              ),
              SizedBox(
                width: 345.w,
                height: 55.h,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => const RecycleSheetWidget(),
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 4,
                    backgroundColor: HexColor('#353535'),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(13.r), // Atur border radius
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
                        'RECYCLE NOW',
                        style: TypographyApp.analyzeAddBtn,
                      ),
                    ],
                  ),
                ),
              ),
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
              AsyncValueWidget(
                value: recycleState.deliverValue,
                data: (data) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 50.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: HexColor('#F1F5F5'),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.delivery_dining,
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
                                            data[index].type.toUpperCase(),
                                            style:
                                                TypographyApp.analyzeMealName,
                                          ),
                                          Text(
                                            data[index].weight,
                                            style: TypographyApp.analyzeMealQty,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '+ ${data[index].coins}',
                                            style: TypographyApp.analyzeMealNum,
                                          ),
                                          Text(
                                            ' Coins',
                                            style:
                                                TypographyApp.analyzeMealNumSub,
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
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product on Sale",
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
              SizedBox(
                height: 210.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
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
                                  products[index],
                                  style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}

class RecycleSheetWidget extends StatelessWidget {
  const RecycleSheetWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
          onTap: () {},
          child: SizedBox(
              height: 340,
              width: double.infinity,
              child: Column(
                children: [
                  Column(
                    children: [
                      Gap.h20,
                      Center(
                        child: Container(
                          width: 105.w,
                          height: 9.h,
                          decoration: BoxDecoration(
                            color: ColorApp.primary.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      ),
                      Gap.h16,
                      Text(
                        'Pilih opsi recycle',
                        style: TypographyApp.titleScan,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Pilih "Send Food Waste" jika ingin mengirim sampah makanan ke bank sampah  atau "Recycle Now" untuk mendaur ulang sekarang.',
                        style: TypographyApp.descScan,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Gap.h36,
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          context.pushNamed(Routes.addRecycle.name);
                        },
                        child: Container(
                          height: 50,
                          width: 304,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: ColorApp.primary,
                          ),
                          child: Center(
                            child: Text(
                              'Send Food Waste',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Gap.h16,
                      InkWell(
                        onTap: () {
                          context.pushNamed(Routes.tutorialRecycle.name);
                        },
                        child: Container(
                          height: 50,
                          width: 304,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              'Recycle Now',
                              style: TextStyle(
                                color: ColorApp.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ))),
    );
  }
}
