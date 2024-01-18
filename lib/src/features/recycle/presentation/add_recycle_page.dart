import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/common_widgets/async_value/async_value_widget.dart';
import 'package:geats/src/common_widgets/input_form/dropdown_form_widget.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/common_state.dart';
import 'package:geats/src/features/recycle/presentation/recycle_controller.dart';
import 'package:geats/src/features/recycle/presentation/recycle_state.dart';
import 'package:geats/src/routes/app_routes.dart';
import 'package:geats/src/shared/extensions/extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';

class AddRecyclePage extends ConsumerWidget {
  const AddRecyclePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commonState = ref.watch(commonControllerProvider);
    final state = ref.watch(recycleControllerProvider);
    final controller = ref.read(recycleControllerProvider.notifier);
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
            'Send Food Waste',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 20.h,
            bottom: 200.h,
          ),
          child: AsyncValueWidget(
            value: state.foodbankValue,
            data: (data) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 329.w,
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 20.h,
                    bottom: 20.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorApp.primary,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Food Waste Type',
                            style: TextStyle(
                              color: ColorApp.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap.h8,
                          DropdownFormWidget(
                            value: state.type,
                            list: const [
                              {'value': 'food', 'text': 'Food'},
                              {'value': 'fruit', 'text': 'Fruit'},
                              {'value': 'vegetable', 'text': 'Vegetable'},
                              {'value': 'mix', 'text': 'Mix'},
                              {'value': 'other', 'text': 'Other'},
                            ],
                            prefixIcon: null,
                            onChanged: (value) {
                              if (value.isNotNull()) {
                                controller.setType(value.toString());
                              }
                            },
                          ),
                        ],
                      ),
                      Gap.h12,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Food Waste Condition',
                            style: TextStyle(
                              color: ColorApp.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap.h12,
                          DropdownFormWidget(
                            value: state.condition,
                            list: const [
                              {'value': 'fresh', 'text': 'Fresh'},
                              {'value': 'rotten', 'text': 'Rotten'},
                              {'value': 'other', 'text': 'Other'},
                            ],
                            prefixIcon: null,
                            onChanged: (value) {
                              if (value.isNotNull()) {
                                controller.setCondition(value.toString());
                              }
                            },
                          ),
                        ],
                      ),
                      Gap.h12,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Food Waste Weight',
                            style: TextStyle(
                              color: ColorApp.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap.h8,
                          DropdownFormWidget(
                            value: state.weight,
                            list: const [
                              {'value': 'less than 1 kg', 'text': '< 1 kg'},
                              {'value': '1 - 5 kg', 'text': '1 - 5 kg'},
                              {'value': '5 - 10 kg', 'text': '5 - 10 kg'},
                              {'value': '10 - 20 kg', 'text': '10 - 20 kg'},
                              {'value': '20 - 50 kg', 'text': '20 - 50 kg'},
                              {'value': '50 - 100 kg', 'text': '50 - 100 kg'},
                              {'value': 'more than 100 kg', 'text': '> 100 kg'},
                            ],
                            prefixIcon: null,
                            onChanged: (value) {
                              if (value.isNotNull()) {
                                controller.setWeight(value.toString());
                              }
                            },
                          ),
                        ],
                      ),
                      Gap.h12,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Food Waste Location',
                            style: TextStyle(
                              color: ColorApp.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap.h8,
                          DropdownFormWidget(
                            value: state.selectedFoodbank,
                            list: state.foodbank!
                                .map((e) => {
                                      'value': e.name,
                                      'text': e.name,
                                    })
                                .toList(),
                            prefixIcon: null,
                            onChanged: (value) {
                              if (value.isNotNull()) {
                                controller
                                    .setSelectedFoodbank(value.toString());
                              }
                            },
                          ),
                        ],
                      ),
                      Gap.h12,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                              color: ColorApp.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Gap.h8,
                          TextFormField(
                            maxLines: 3,
                            decoration: InputDecoration(
                              hintText:
                                  'Example: Food waste in the form of leftover chicken, rice, tofu, and vegetables',
                              hintStyle: TextStyle(
                                color: ColorApp.secondary.withOpacity(0.4),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                  color: ColorApp.secondary.withOpacity(0.4),
                                  width: 1.w,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.r),
                                borderSide: BorderSide(
                                  color: ColorApp.secondary.withOpacity(0.4),
                                  width: 1.w,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Gap.h20,
                Container(
                  height: 400.h,
                  width: 329.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorApp.primary,
                    ),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap.h12,
                      Text(
                        'Location of Food Bank',
                        style: TextStyle(
                          color: ColorApp.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Gap.h12,
                      Stack(
                        children: [
                          SizedBox(
                            height: 300,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(30)),
                              child: InkWell(
                                onTap: !state.isOverlayVisible
                                    ? () {
                                        controller.setOverlayVisible();
                                      }
                                    : null,
                                child: IgnorePointer(
                                  ignoring: true,
                                  child: FlutterMap(
                                    options: const MapOptions(
                                      initialZoom: 3.2,
                                    ),
                                    children: [
                                      TileLayer(
                                        urlTemplate:
                                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                                        userAgentPackageName: 'com.example.app',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: state.isOverlayVisible,
                            child: Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: 300,
                                width: 329,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black.withOpacity(0.3),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        controller.setOverlayVisible();
                                        context.pushNamed(
                                            Routes.locationRecycle.name);
                                      },
                                      child: const IgnorePointer(
                                        child: Text(
                                          'See Location',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomSheet: Container(
          padding: const EdgeInsets.all(16),
          width: 1.sw,
          height: 98.h,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              color: HexColor('#929DAB').withOpacity(0.10),
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ]),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorApp.primary,
              padding: EdgeInsets.symmetric(horizontal: 87.w, vertical: 18.h),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            child: Text(
              "Send",
              style: TypographyApp.homeOnBtn,
            ),
            onPressed: () async {
              await EasyLoading.show(
                status: 'loading...',
                maskType: EasyLoadingMaskType.black,
              );
              String uid = '${commonState.user?.id}';
              await controller.addDeliver(uid);
              await controller.getDeliver(uid);

              await EasyLoading.showSuccess('Success',
                  duration: const Duration(seconds: 2));
              Future.delayed(const Duration(seconds: 2), () {
                context.goNamed(Routes.botNavBar.name);
              });
            },
          ),
        ),
      ),
    );
  }
}
