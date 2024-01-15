import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/scan/application/scan_service.dart';
import 'package:geats/src/features/scan/domain/nutrifacts.dart';
import 'package:geats/src/features/scan/presentation/scan_state.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:logger/logger.dart';

class ScanController extends StateNotifier<ScanState> {
  final ScanService _scanService;
  ScanController(this._scanService) : super(ScanState());

  final BarcodeScanner barcodeScanner = BarcodeScanner();
  final TextRecognizer textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);

  Future<void> addProduct(String barcode, List<NutriFacts>? products) async {
    state = state.copyWith(
      nutriValue: const AsyncLoading(),
    );

    final result = await _scanService.addProduct(barcode, products);

    result.when(
      success: (data) {
        state = state.copyWith(
          nutriValue: AsyncData(data),
          nutri: data,
        );
      },
      failure: (error, stackTrace) {
        Logger().e('error: $error');
        state = state.copyWith(
          nutriValue: AsyncError(error, stackTrace),
        );
      },
    );
  }

  void clearProduct() {
    state = state.copyWith(
      nutriValue: const AsyncData([]),
      nutri: [],
    );
  }

  Future<String> processImage(String path) async {
    final inputImage = InputImage.fromFilePath(path);
    final barcodes = await barcodeScanner.processImage(inputImage);
    String text = '';
    for (final barcode in barcodes) {
      text = barcode.displayValue.toString();
    }
    return text;
  }

  Future<String> processImageToText(String path) async {
    final inputImage = InputImage.fromFilePath(path);
    final recognizedText = await textRecognizer.processImage(inputImage);
    Logger().f('recognizedText: ${recognizedText.text}');
    // for (TextBlock block in recognizedText.blocks) {
    //   Logger().i('Block text: ${block.text}');
    //   for (TextLine line in block.lines) {
    //     Logger().t('Line text: ${line.text}');
    //     for (TextElement element in line.elements) {
    //       Logger().e('Element text: ${element.text}');
    //     }
    //   }
    // }
    return recognizedText.text;
  }

  @override
  void dispose() {
    barcodeScanner.close();
    textRecognizer.close();
    super.dispose();
  }
}

final scanControllerProvider =
    StateNotifierProvider.autoDispose<ScanController, ScanState>((ref) {
  final scanService = ref.read(scanServiceProvider);
  return ScanController(scanService);
});
