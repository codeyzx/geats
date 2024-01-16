import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/scan/application/scan_service.dart';
import 'package:geats/src/features/scan/domain/nutrifacts.dart';
import 'package:geats/src/features/scan/presentation/scan_state.dart';

class ScanController extends StateNotifier<ScanState> {
  final ScanService _scanService;
  ScanController(this._scanService) : super(ScanState());

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
}

final scanControllerProvider =
    StateNotifierProvider<ScanController, ScanState>((ref) {
  final scanService = ref.read(scanServiceProvider);
  return ScanController(scanService);
});
