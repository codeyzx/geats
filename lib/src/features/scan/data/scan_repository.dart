import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/scan/domain/nutrifacts.dart';
import 'package:geats/src/services/services.dart';

class ScanRepository {
  final DioClient _dioClient;

  ScanRepository(this._dioClient);

  Future<Result<List<NutriFacts>>> addProduct(
      String barcode, List<NutriFacts>? products) async {
    try {
      final result =
          await _dioClient.get('${Endpoint.nutriFacts}/$barcode.json');
      final resultBody = result['product'];
      final data = NutriFacts.fromJson(resultBody);
      products ??= [];
      products.add(data);
      return Result.success(products);
    } catch (e, st) {
      return Result.failure(NetworkExceptions.getDioException(e), st);
    }
  }
}

final scanRepositoryProvider = Provider<ScanRepository>((ref) {
  final dio = ref.read(dioClientProvider);
  return ScanRepository(dio);
});
