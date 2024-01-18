import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/recycle/data/recycle_repository.dart';
import 'package:geats/src/features/recycle/domain/deliver.dart';
import 'package:geats/src/features/recycle/domain/foodbank.dart';
import 'package:geats/src/services/services.dart';

class RecycleService {
  final RecycleRepository _recycleRepository;

  RecycleService(
    this._recycleRepository,
  );

  Future<Result<List<FoodBank>>> getFoodBank() async {
    final result = await _recycleRepository.getFoodBank();
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<List<Deliver>>> getDeliver(String uid) async {
    final result = await _recycleRepository.getDeliver(uid);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<String>> addDeliver(Deliver deliver) async {
    final result = await _recycleRepository.addDeliver(deliver);
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

final recycleServiceProvider = Provider<RecycleService>((ref) {
  final recycleRepository = ref.read(recycleRepositoryProvider);
  return RecycleService(recycleRepository);
});
