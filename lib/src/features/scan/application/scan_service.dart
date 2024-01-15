import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/scan/data/scan_repository.dart';
import 'package:geats/src/features/scan/domain/nutrifacts.dart';
import 'package:geats/src/services/services.dart';

class ScanService {
  final ScanRepository _scanRepository;

  ScanService(this._scanRepository);

  Future<Result<List<NutriFacts>>> addProduct(
      String barcode, List<NutriFacts>? products) async {
    final result = await _scanRepository.addProduct(barcode, products);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}

final scanServiceProvider = Provider<ScanService>((ref) {
  final scanRepository = ref.read(scanRepositoryProvider);
  return ScanService(scanRepository);
});
