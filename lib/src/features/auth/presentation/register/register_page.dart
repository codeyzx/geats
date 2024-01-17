import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/presentation.dart';
import 'package:geats/src/routes/routes.dart';
import 'package:geats/src/services/services.dart';

class RegisterPage extends ConsumerWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(registerControllerProvider, (prevState, state) {
      if (prevState?.registerValue != state.registerValue) {
        state.registerValue.whenOrNull(
          data: (message) {
            if (message != null) {
              context.goNamed(Routes.question.name);
            }
          },
          error: (error, stackTrace) {
            final message =
                NetworkExceptions.getErrorMessage(error as NetworkExceptions);
            appSnackBar(context, ColorApp.red, message);
          },
        );
      }
    });

    return StatusBarWidget(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: PaddingWidget(
              child: Column(
                children: [
                  const Spacer(),
                  Gap.h32,
                  const RegisterFormSection(),
                  Gap.h32,
                  const RegisterButtonSection(),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TypographyApp.headline3,
                      ),
                      Gap.w8,
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: Text(
                          'Sign In',
                          style: TypographyApp.headline3.copyWith(
                            color: ColorApp.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap.h36
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
