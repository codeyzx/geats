import 'dart:async';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:geats/src/features/scan/presentation/widget/barcode_preview_overlay.dart';
import 'package:geats/src/shared/extensions/mlkit_utils.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';

class ScanPage extends StatefulWidget {
  final bool isCompare;
  const ScanPage({super.key, required this.isCompare});

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final _barcodeScanner = BarcodeScanner(formats: [BarcodeFormat.all]);
  List<Barcode> _barcodes = [];
  AnalysisImage? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CameraAwesomeBuilder.awesome(
        saveConfig: SaveConfig.photoAndVideo(
          initialCaptureMode: CaptureMode.photo,
        ),
        sensorConfig: SensorConfig.single(
          flashMode: FlashMode.auto,
          aspectRatio: CameraAspectRatios.ratio_16_9,
        ),
        previewFit: CameraPreviewFit.fitWidth,
        previewDecoratorBuilder: (state, preview) {
          return BarcodePreviewOverlay(
            state: state,
            barcodes: _barcodes,
            analysisImage: _image,
            preview: preview,
          );
        },
        topActionsBuilder: (state) {
          return AwesomeTopActions(
            state: state,
            children: [
              AwesomeFlashButton(state: state),
              if (state is PhotoCameraState)
                AwesomeAspectRatioButton(state: state),
            ],
          );
        },
        middleContentBuilder: (state) {
          return const SizedBox.shrink();
        },
        bottomActionsBuilder: (state) {
          return const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Scan the barcodes",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          );
        },
        onImageForAnalysis: (img) => _processImageBarcode(img),
        imageAnalysisConfig: AnalysisConfig(
          androidOptions: const AndroidAnalysisOptions.nv21(
            width: 256,
          ),
          maxFramesPerSecond: 3,
        ),
      ),
    );
  }

  Future _processImageBarcode(AnalysisImage img) async {
    try {
      var recognizedBarCodes =
          await _barcodeScanner.processImage(img.toInputImage());
      setState(() {
        _barcodes = recognizedBarCodes;
        _image = img;
      });
    } catch (error) {
      debugPrint("...sending image resulted error $error");
    }
  }
}
