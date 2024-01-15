import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:geats/gen/assets.gen.dart';
import 'package:geats/src/common_widgets/common_widgets.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/common/presentation/common_controller.dart';
import 'package:geats/src/routes/app_routes.dart';
import 'package:geats/src/services/remote/network_exceptions.dart';
import 'package:geats/src/shared/extensions/build_context.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(commonControllerProvider, (prevState, state) {
      Future.delayed(const Duration(seconds: 3)).then((_) async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        final int? session = prefs.getInt('onboard');
        if (session == null) {
          await prefs.setInt('onboard', 1);
          Future.delayed(const Duration(seconds: 1), () {
            context.goNamed(Routes.onboard.name);
          });
        } else {
          if (prevState?.userValue != state.userValue) {
            state.userValue.whenOrNull(
              data: (data) {
                if (data != null) {
                  context.goNamed(Routes.botNavBar.name);
                } else {
                  context.goNamed(Routes.login.name);
                }
              },
              error: (error, stackTrace) {
                final message = NetworkExceptions.getErrorMessage(
                    error as NetworkExceptions);
                if (message == "User not found") {
                  context.goNamed(Routes.botNavBar.name);
                } else {
                  context.goNamed(Routes.botNavBar.name);
                  appSnackBar(context, Colors.red, message);
                }
              },
            );
          }
        }
      });
    });

    return StatusBarWidget(
      child: Scaffold(
        body: SizedBox(
          height: context.screenHeight,
          width: context.screenWidth,
          child: Column(
            children: [
              const Spacer(flex: 4),
              Assets.icons.geatsLogo.svg(
                width: context.screenWidthPercentage(0.6),
                fit: BoxFit.fitWidth,
              ),
              const Spacer(flex: 4),
              Text("By", style: TypographyApp.splashBy),
              Text("ORBIT", style: TypographyApp.splashTeamName),
              Gap.h28
            ],
          ),
        ),
      ),
    );
  }
}
