import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/data.dart';
import 'package:geats/src/features/domain.dart';
import 'package:geats/src/services/services.dart';

class AuthService {
  final AuthRepository _authRepository;

  AuthService(
    this._authRepository,
  );

  Future<Result<String?>> login(RequestLogin requestLogin) async {
    final result = await _authRepository.login(requestLogin);
    return result.when(
      success: (data) {
        return const Result.success('Login Success!');
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }

  Future<Result<String?>> register(RequestRegister requestRegister) async {
    final result = await _authRepository.register(requestRegister);
    return result.when(
      success: (data) {
        return const Result.success('Register Success!');
      },
      failure: (error, stackTrace) {
        return Result.failure(error, stackTrace);
      },
    );
  }
}

final authServiceProvider = Provider<AuthService>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return AuthService(authRepository);
});
