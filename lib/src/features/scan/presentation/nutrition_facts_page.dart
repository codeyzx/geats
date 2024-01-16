import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/gen/assets.gen.dart';
import 'package:geats/src/common_widgets/async_value/async_value_widget.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/features/scan/presentation/scan_controller.dart';
import 'package:geats/src/routes/routes.dart';
import 'package:go_router/go_router.dart';

class NutritionFactsPage extends ConsumerWidget {
  const NutritionFactsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanControllerProvider);
    final controller = ref.read(scanControllerProvider.notifier);
    final commonController = ref.read(commonControllerProvider.notifier);
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Nutrition Facts',
            style: TypographyApp.titleScan,
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                controller.clearProduct();
                commonController.setPage(0);
                context.goNamed(Routes.botNavBar.name);
              }),
          actions: [
            Container(
              margin: EdgeInsets.only(right: 15.w),
              child: IconButton(
                icon: Assets.icons.icCompare.svg(
                  height: 32.h,
                  width: 32.w,
                  colorFilter:
                      ColorFilter.mode(ColorApp.primary, BlendMode.srcIn),
                ),
                tooltip: 'Compare',
                onPressed: () {
                  context.pushNamed(
                    Routes.scan.name,
                    extra: const Extras(
                      datas: {
                        ExtrasKey.isCompare: true,
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: AsyncValueWidget(
          value: state.nutriValue,
          error: (_) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Data not found',
                    style: TypographyApp.scanText,
                  ),
                  Gap.h16,
                  TextButton(
                    onPressed: () {
                      context.pushNamed(
                        Routes.scan.name,
                        extra: const Extras(
                          datas: {
                            ExtrasKey.isCompare: true,
                          },
                        ),
                      );
                    },
                    child: Text(
                      'Back',
                      style: TypographyApp.scanText.copyWith(
                        color: ColorApp.primary,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          data: (data) => SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: data
                  .map(
                    (product) => Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: EdgeInsets.only(top: 20.h),
                              child: Row(
                                children: [
                                  Text(
                                    product.name,
                                    style: TypographyApp.scanText,
                                  ),
                                  Text(
                                    ' (${data.indexOf(product) + 1})',
                                    style: TypographyApp.scanText.copyWith(
                                      fontSize: 16.sp,
                                      color: ColorApp.primary,
                                    ),
                                  )
                                ],
                              )),
                          const LineWidget(),
                          Gap.h16,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Calories',
                                style: TypographyApp.scanText,
                              ),
                              product.calories == 0
                                  ? Text('Not Found',
                                      style: TypographyApp.scanText)
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${product.calories.toInt()}',
                                          style:
                                              TypographyApp.scanText.copyWith(
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        Text(
                                          'kcal',
                                          style: TypographyApp.scanText,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          const LineWidget(),
                          Gap.h16,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total Fat',
                                style: TypographyApp.scanText,
                              ),
                              product.fat == 0
                                  ? Text('Not Found',
                                      style: TypographyApp.scanText)
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${product.fat}',
                                          style:
                                              TypographyApp.scanText.copyWith(
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        Text(
                                          'g',
                                          style: TypographyApp.scanText,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Protein',
                                style: TypographyApp.scanText,
                              ),
                              product.proteins == 0
                                  ? Text('Not Found',
                                      style: TypographyApp.scanText)
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${product.proteins}',
                                          style:
                                              TypographyApp.scanText.copyWith(
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        Text(
                                          'g',
                                          style: TypographyApp.scanText,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Carbs',
                                style: TypographyApp.scanText,
                              ),
                              product.carbs == 0
                                  ? Text('Not Found',
                                      style: TypographyApp.scanText)
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '${product.carbs}',
                                          style:
                                              TypographyApp.scanText.copyWith(
                                            fontSize: 24.sp,
                                          ),
                                        ),
                                        Text(
                                          'g',
                                          style: TypographyApp.scanText,
                                        ),
                                      ],
                                    ),
                            ],
                          ),
                          const LineWidget(),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}

class LineWidget extends StatelessWidget {
  const LineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 1,
      width: double.infinity,
      color: Colors.grey[400],
    );
  }
}
