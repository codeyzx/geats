import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/data.dart';

class HomeService {
  final HomeRepository _homeRepository;

  HomeService(
    this._homeRepository,
  );

  Future<void> fetchHome() async {}
}

final homeServiceProvider = Provider<HomeService>((ref) {
  final homeRepository = ref.read(homeRepositoryProvider);

  return HomeService(homeRepository);
});
