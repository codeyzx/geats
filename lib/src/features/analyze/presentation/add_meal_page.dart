import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/common_widgets/async_value/async_value_widget.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/analyze/presentation/analyze_controller.dart';
import 'package:geats/src/features/analyze/presentation/analyze_state.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/common/presentation/common_state.dart';
import 'package:geats/src/routes/app_routes.dart';
import 'package:geats/src/shared/extensions/extensions.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:logger/logger.dart';

class AddMealPage extends ConsumerStatefulWidget {
  const AddMealPage({super.key});

  @override
  ConsumerState<AddMealPage> createState() => _AddMealPageState();
}

class _AddMealPageState extends ConsumerState<AddMealPage> {
  AnalyzeController get controller =>
      ref.read(analyzeControllerProvider.notifier);
  AnalyzeState get state => ref.watch(analyzeControllerProvider);
  CommonController get commonController =>
      ref.read(commonControllerProvider.notifier);
  CommonState get commonState => ref.watch(commonControllerProvider);

  @override
  void initState() {
    safeRebuild(() {
      controller.getMeals();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            'Add Meal',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          actions: [
            IconButton(
              padding: EdgeInsets.only(right: 20.w),
              icon: Icon(
                Icons.check,
                color: Colors.black,
                size: 30.w,
              ),
              onPressed: () async {
                await EasyLoading.show(
                  status: 'loading...',
                  maskType: EasyLoadingMaskType.black,
                );
                final selectedMeals = state.searchResults.where(
                  (element) => element.isSelected!,
                );
                await controller.addMeal(
                    selectedMeals.toList(), DateTime.now().toYyyyMMDd);

                await commonController.getProfile();

                controller.getDailyMeals(
                    DateTime.now(), commonState.user?.dailyMeals);
                await commonController.getProfile();
                await EasyLoading.showSuccess('Success',
                    duration: const Duration(seconds: 2));
                Future.delayed(const Duration(seconds: 2), () {
                  context.goNamed(Routes.botNavBar.name);
                });
              },
            ),
          ],
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
                  controller: controller.searchController,
                  onChanged: controller.searchMeal,
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
                Gap.h32,
                AsyncValueWidget(
                  value: state.searchMealsValue,
                  data: (data) => ListView.builder(
                    itemCount: data.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final meals = state.searchResults;
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.0.h),
                        child: InkWell(
                          onTap: () {
                            controller.selectMeal(data[index].id);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Transform.scale(
                                scale: 2,
                                child: Checkbox(
                                  value: (meals.isEmpty
                                      ? false
                                      : (meals.any((element) =>
                                          element.id == data[index].id &&
                                          element.isSelected == true))),
                                  onChanged: (_) {
                                    controller.selectMeal(data[index].id);
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.r),
                                  ),
                                  side: BorderSide(
                                    color: HexColor('#A9A9A9'),
                                    width: 1.w,
                                  ),
                                  activeColor: HexColor('#85B1B4'),
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(
                                    width: 280.w,
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
                                              data[index].name,
                                              style:
                                                  TypographyApp.analyzeMealName,
                                            ),
                                            Text(
                                              '${data[index].calories} calories',
                                              style:
                                                  TypographyApp.analyzeMealQty,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                controller.removeQtyMeal(
                                                    data[index].id);
                                              },
                                              icon: Icon(
                                                Icons
                                                    .remove_circle_outline_rounded,
                                                color: (meals.isEmpty
                                                    ? ColorApp.secondary
                                                        .withOpacity(0.5)
                                                    : (meals.any((element) =>
                                                            element.id ==
                                                                data[index]
                                                                    .id &&
                                                            element.qty == 1)
                                                        ? ColorApp.secondary
                                                            .withOpacity(0.5)
                                                        : ColorApp.secondary)),
                                              ),
                                            ),
                                            Text(
                                              (meals.isEmpty
                                                  ? data[index].qty.toString()
                                                  : (meals.any((element) =>
                                                          element.id ==
                                                          data[index].id)
                                                      ? meals
                                                          .firstWhere(
                                                              (element) =>
                                                                  element.id ==
                                                                  data[index]
                                                                      .id)
                                                          .qty
                                                          .toString()
                                                      : data[index]
                                                          .qty
                                                          .toString())),
                                              style: TypographyApp
                                                  .analyzeMealQty
                                                  .copyWith(
                                                color: ColorApp.secondary,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                controller
                                                    .addQtyMeal(data[index].id);
                                              },
                                              icon: Icon(
                                                Icons
                                                    .add_circle_outline_rounded,
                                                color: ColorApp.secondary,
                                              ),
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
                        ),
                      );
                    },
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
