import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/common_widgets/async_value/async_value_widget.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/recycle/domain/foodbank.dart';
import 'package:geats/src/features/recycle/presentation/recycle_controller.dart';
import 'package:hexcolor/hexcolor.dart';

class LocationRecyclePage extends ConsumerWidget {
  const LocationRecyclePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recycleControllerProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        titleSpacing: -10,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Food Bank Location',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap.h8,
              TextFormField(
                style: TypographyApp.invenSearchOn,
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TypographyApp.invenSearchHint.copyWith(
                    color: HexColor('#747688'),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 12.h),
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: HexColor('#747688'),
                    size: 26.w,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17.r),
                    borderSide: BorderSide(
                      color: HexColor('#CDCACA'),
                      width: 1.w,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(17.r),
                    borderSide: BorderSide(
                      color: ColorApp.secondary,
                      width: 1.w,
                    ),
                  ),
                ),
              ),
              Gap.h16,
              Text(
                'Nearby Food Bank',
                style: TypographyApp.text1.copyWith(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap.h16,
              SizedBox(
                height: 240.h,
                child: AsyncValueWidget(
                  value: state.foodbankValue,
                  data: (data) => ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                          padding: EdgeInsets.only(right: 15.w),
                          child: Container(
                            width: 200.w,
                            decoration: BoxDecoration(
                              color: HexColor('#F2F2F2'),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15.w,
                                vertical: 10.h,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 120.h,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Center(
                                      child:

                                          //           CachedNetworkImage(
                                          //   imageUrl:
                                          //       'https://picsum.photos/250?image=9',
                                          //   imageBuilder: (context, imageProvider) =>
                                          //       Container(
                                          //     decoration: BoxDecoration(
                                          //       borderRadius:
                                          //           BorderRadius.circular(10.r),
                                          //       image: DecorationImage(
                                          //         image: imageProvider,
                                          //         fit: BoxFit.cover,
                                          //       ),
                                          //     ),
                                          //   ),
                                          //   placeholder: (context, url) =>
                                          //       const Center(
                                          //     child: CircularProgressIndicator(),
                                          //   ),
                                          //   errorWidget: (context, url, error) =>
                                          //       const Icon(Icons.error),
                                          // ),

                                          Stack(children: [
                                        Container(
                                          height: 100.h,
                                          width: 150.w,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.r),
                                            color: HexColor('#F1F5F5'),
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.fastfood_rounded,
                                              color: HexColor('#85B1B4'),
                                              size: 50.w,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Container(
                                            height: 30.h,
                                            width: 50.w,
                                            margin: EdgeInsets.only(
                                              top: 4.h,
                                              left: 10.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Open',
                                                style: TypographyApp.text1
                                                    .copyWith(
                                                  color: ColorApp.secondary,
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                  Gap.h8,
                                  Text(
                                    data[index].name,
                                    style: TypographyApp.text1.copyWith(
                                      color: Colors.black,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Gap.h4,
                                  Text(
                                    data[index].address,
                                    style: TypographyApp.text1.copyWith(
                                      color: HexColor('#747688'),
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ),
              Gap.h16,
              Text(
                'All Food Bank',
                style: TypographyApp.text1.copyWith(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap.h16,
              AsyncValueWidget(
                value: state.foodbankValue,
                data: (data) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return FoodBankWidget(
                      foodbank: data[index],
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

class FoodBankWidget extends StatelessWidget {
  final FoodBank foodbank;

  const FoodBankWidget({
    required this.foodbank,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Container(
        height: 120.h,
        decoration: BoxDecoration(
          color: HexColor('#F2F2F2'),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    height: 60.h,
                    width: 60.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child:

                          // CachedNetworkImage(
                          //   imageUrl: 'https://picsum.photos/250?image=9',
                          //   imageBuilder: (context, imageProvider) => Container(
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(10.r),
                          //       image: DecorationImage(
                          //         image: imageProvider,
                          //         fit: BoxFit.cover,
                          //       ),
                          //     ),
                          //   ),
                          //   placeholder: (context, url) => const Center(
                          //     child: CircularProgressIndicator(),
                          //   ),
                          //   errorWidget: (context, url, error) =>
                          //       const Icon(Icons.error),
                          // ),
                          Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: HexColor('#F1F5F5'),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.fastfood_rounded,
                            color: HexColor('#85B1B4'),
                            size: 30.w,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gap.w8,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 200.w,
                        child: Text(
                          foodbank.name,
                          style: TypographyApp.text1.copyWith(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Gap.h4,
                      Text(
                        foodbank.address,
                        style: TypographyApp.text1.copyWith(
                          color: HexColor('#747688'),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gap.h8,
              Row(
                children: [
                  Container(
                    height: 30.h,
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Center(
                      child: Text(
                        'Open Now',
                        style: TypographyApp.text1.copyWith(
                          color: ColorApp.secondary,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Gap.w8,
                  Container(
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Center(
                      child: Text(
                        'Close at ${foodbank.closeAt}',
                        style: TypographyApp.text1.copyWith(
                          color: HexColor('#747688'),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
