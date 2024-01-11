import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/home/application/home_service.dart';
import 'package:geats/src/features/home/presentation/home_state.dart';

class HomeController extends StateNotifier<HomeState> {
  final HomeService _homeService;

  HomeController(
    this._homeService,
  ) : super(HomeState());

  void fetchData() {}
}

final homeControllerProvider =
    StateNotifierProvider<HomeController, HomeState>((ref) {
  final homeService = ref.read(homeServiceProvider);
  return HomeController(homeService);
});
