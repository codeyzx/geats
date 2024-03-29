import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/application.dart';
import 'package:geats/src/features/domain.dart';
import 'package:geats/src/features/presentation.dart';
import 'package:geats/src/services/services.dart';
import 'package:geats/src/shared/extensions/extensions.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final AuthService _authService;
  RegisterController(
    this._authService,
  ) : super(RegisterState());

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  Future<void> register() async {
    if (!state.formKey.currentState!.validate()) {
      return;
    }

    // loading
    state = state.copyWith(
      registerValue: const AsyncLoading(),
    );

    final requestRegister = RequestRegister(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    final result = await _authService.register(requestRegister);

    result.when(
      success: (data) {
        // success
        state = state.copyWith(
          registerValue: AsyncData(data),
        );
      },
      failure: (error, stackTrace) {
        final errors = NetworkExceptions.getErrors(error);
        // failure
        state = state.copyWith(
          registerValue: AsyncError(error, stackTrace),
          errors: errors,
        );
      },
    );
  }

  void onObscureTap() {
    // with setState in StatefulWidget
    //setState(() {
    //   isObscure = !isObscure;
    // });

    // with state.copyWith in Riverpod
    state = state.copyWith(
      isObscure: !state.isObscure,
    );
  }

  void onObscureConfirmTap() {
    state = state.copyWith(
      isObscureConfirm: !state.isObscureConfirm,
    );
  }

  void onRoleValueChanged(value) {
    state = state.copyWith(
      roleValue: value,
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmController.dispose();
    super.dispose();
  }

  void resetErrors(String key) {
    Map<String, dynamic>? map = {...?state.errors};
    map.remove(key);
    state = state.copyWith(errors: map);
  }

  String? validateName(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    } else if (!value!.isEmailValid) {
      return "email not valid";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    } else if (!value!.isPasswordValid) {
      return "Password must be more than 8";
    }
    return null;
  }

  String? validatePasswordConfirm(String? value) {
    if (value.isNullOrEmpty()) {
      return "Cannot be empty";
    } else if (!value!.isPasswordValid) {
      return "Password must be more than 8";
    } else if (value != passwordController.text) {
      return "Password confirm doesn't match";
    }
    return null;
  }
}

final registerControllerProvider =
    StateNotifierProvider.autoDispose<RegisterController, RegisterState>((ref) {
  final authService = ref.read(authServiceProvider);
  return RegisterController(authService);
});
