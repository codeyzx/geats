import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/routes/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.photo(
            mirrorFrontCamera: true,
            pathBuilder: (sensors) async {
              final Directory extDir = await getTemporaryDirectory();
              final testDir = await Directory(
                extDir.path,
              ).create(recursive: true);
              // _processImage(InputImage.fromFilePath(testDir.path));/
              Future.delayed(const Duration(seconds: 1), () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) => GestureDetector(
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
                                      onTap: () {
                                        context
                                            .pushNamed(Routes.nutriFacts.name);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 304,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
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
                                      onTap: () {
                                        context
                                            .pushNamed(Routes.nutriFacts.name);
                                      },
                                      child: Container(
                                        height: 50,
                                        width: 304,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                  ),
                  isScrollControlled: true,
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(10),
                    ),
                  ),
                );
              });
              if (sensors.length == 1) {
                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                return SingleCaptureRequest(filePath, sensors.first);
              } else {
                // Separate pictures taken with front and back camera
                return MultipleCaptureRequest(
                  {
                    for (final sensor in sensors)
                      sensor:
                          '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
                  },
                );
              }
            },
            exifPreferences: ExifPreferences(saveGPSLocation: true),
          ),
          sensorConfig: SensorConfig.single(
            sensor: Sensor.position(SensorPosition.back),
            flashMode: FlashMode.auto,
            aspectRatio: CameraAspectRatios.ratio_16_9,
            zoom: 0.0,
          ),
          enablePhysicalButton: true,
          // filter: AwesomeFilter.AddictiveRed,
          previewFit: CameraPreviewFit.contain,
          availableFilters: awesomePresetFiltersList,
        ),
      ),
    );
  }
}

Future<void> _processImage(InputImage inputImage) async {
  final BarcodeScanner barcodeScanner = BarcodeScanner();

  final barcodes = await barcodeScanner.processImage(inputImage);
  String text = 'Barcodes found: ${barcodes.length}\n\n';
  for (final barcode in barcodes) {
    text += 'Barcode: ${barcode.rawValue}\n\n';
  }
  Logger().i(text);
}
