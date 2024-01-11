import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeRepository {}

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});
