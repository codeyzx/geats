import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/scan/presentation/scan_controller.dart';
import 'package:geats/src/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';

class ScanSheet extends ConsumerWidget {
  final String path;
  final bool isCompare;

  const ScanSheet({
    required this.path,
    required this.isCompare,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(scanControllerProvider);
    final controller = ref.watch(scanControllerProvider.notifier);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
          onTap: () {},
          child: Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                // TODO: BENERIN BORDER RADIUS
                borderRadius: BorderRadius.circular(25),
              ),
              child: Column(
                children: [
                  Column(
                    children: [
                      Gap.h32,
                      Text(
                        'Pilih opsi memindai',
                        style: TypographyApp.titleScan,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Pilih "Barcode" jika mengambil gambar barcode atau "Nutrition Facts" untuk informasi nilai gizi.',
                        style: TypographyApp.descScan,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Gap.h36,
                  Column(
                    children: [
                      InkWell(
                        onTap: () async {
                          final barcode = await controller.processImage(path);
                          if (barcode.isEmpty) {
                            Future.delayed(const Duration(seconds: 1), () {
                              QuickAlert.show(
                                  context: context,
                                  type: QuickAlertType.error,
                                  title: 'Barcode tidak ditemukan',
                                  text: 'Silahkan coba lagi');
                            });
                          } else {
                            if (!isCompare) controller.clearProduct();

                            await controller.addProduct(
                              barcode,
                              state.nutri,
                            );

                            Future.delayed(const Duration(seconds: 1), () {
                              context.pushNamed(
                                Routes.nutriFacts.name,
                                extra: const Extras(
                                  datas: {
                                    ExtrasKey.isCompare: false,
                                  },
                                ),
                              );
                            });
                          }
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
                              'BARCODE',
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
                        onTap: () async {
                          final result =
                              await controller.processImageToText(path);
                          if (result.isEmpty) {
                          } else {}
                          Future.delayed(const Duration(seconds: 1), () {
                            context.pushNamed(Routes.nutriFacts.name);
                          });
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
                              'Nutrition Facts',
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
                  )
                ],
              ))),
    );
  }
}
