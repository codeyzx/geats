import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:geats/src/features/scan/presentation/widget/scan_sheet.dart';
import 'package:path_provider/path_provider.dart';

class ScanPage extends StatelessWidget {
  final bool isCompare;
  const ScanPage({super.key, required this.isCompare});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CameraAwesomeBuilder.awesome(
          sensorConfig: SensorConfig.single(
            sensor: Sensor.position(SensorPosition.back),
            flashMode: FlashMode.auto,
            aspectRatio: CameraAspectRatios.ratio_16_9,
            zoom: 0.0,
          ),
          enablePhysicalButton: true,
          previewFit: CameraPreviewFit.contain,
          availableFilters: awesomePresetFiltersList,
          saveConfig: SaveConfig.photo(
            mirrorFrontCamera: true,
            exifPreferences: ExifPreferences(saveGPSLocation: true),
            pathBuilder: (sensors) async {
              final Directory extDir = await getTemporaryDirectory();
              final testDir = await Directory(
                extDir.path,
              ).create(recursive: true);

              if (sensors.length == 1) {
                final String filePath =
                    '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                Future.delayed(const Duration(seconds: 2), () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) =>
                        ScanSheet(path: filePath, isCompare: isCompare),
                    isScrollControlled: true,
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                  );
                });
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
          ),
        ),
      ),
    );
  }
}
