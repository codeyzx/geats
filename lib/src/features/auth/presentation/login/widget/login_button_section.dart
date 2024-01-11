import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/features/auth/presentation/login/login_controller.dart';

class LoginButtonSection extends ConsumerWidget {
  const LoginButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(loginControllerProvider.notifier);
    final state = ref.watch(loginControllerProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ButtonWidget.primary(
          text: 'SIGN IN',
          onTap: controller.login,
          isLoading: state.isLoading,
        ),
      ],
    );
  }
}
