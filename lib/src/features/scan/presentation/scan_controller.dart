import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/scan/presentation/scan_state.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class ScanController extends StateNotifier<ScanState> {
  ScanController() : super(ScanState());

  final BarcodeScanner barcodeScanner = BarcodeScanner();
  final TextRecognizer textRecognizer =
      TextRecognizer(script: TextRecognitionScript.latin);

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
    for (TextBlock block in recognizedText.blocks) {
      // final Rect rect = block.boundingBox;
      // final List<Point<int>> cornerPoints = block.cornerPoints;
      // final String text = block.text;
      // final List<String> languages = block.recognizedLanguages;

      // Logger().i('block $text and $rect and $cornerPoints and $languages');

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        // Logger().i('line ${line.text}');
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
          // Logger().i('element ${element.text} ');
        }
      }
    }
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
  return ScanController();
});
