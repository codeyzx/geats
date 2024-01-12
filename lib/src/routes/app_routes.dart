import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/recycle/presentation/recycle_page.dart';
import 'package:geats/src/features/scan/presentation/nutrition_facts_page.dart';
import 'package:geats/src/features/scan/presentation/scan_page.dart';
import 'package:go_router/go_router.dart';
import 'package:geats/src/constants/constants.dart';
import 'package:geats/src/features/auth/domain/user.dart';
import 'package:geats/src/features/common/presentation/botnavbar/botnavbar_page.dart';
import 'package:geats/src/features/common/presentation/splash/splash_page.dart';
import 'package:geats/src/features/profile/presentation/profile_edit_page.dart';
import 'package:geats/src/features/common/presentation/onboard/onboard_page.dart';
import 'package:geats/src/features/presentation.dart';
import 'package:geats/src/routes/routes.dart';

enum Routes {
  splash,
  onboard,
  login,
  register,
  botNavBar,
  scan,
  nutriFacts,
  recycle,
  editProfile,
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      navigatorKey: navigatorKey,
      debugLogDiagnostics: true,
      initialLocation: '/splash',
      routerNeglect: true,
      redirectLimit: 1,
      routes: [
        GoRoute(
          path: '/splash',
          name: Routes.splash.name,
          builder: (context, state) => const SplashPage(),
        ),
        GoRoute(
          path: '/onboard',
          name: Routes.onboard.name,
          builder: (context, state) => const OnboardPage(),
        ),
        GoRoute(
          path: '/login',
          name: Routes.login.name,
          builder: (context, state) => const LoginPage(),
        ),
        GoRoute(
          path: '/register',
          name: Routes.register.name,
          builder: (context, state) => const RegisterPage(),
        ),
        GoRoute(
          path: '/botnavbar',
          name: Routes.botNavBar.name,
          builder: (context, state) => const BotNavBarPage(),
        ),
        GoRoute(
          path: '/scan',
          name: Routes.scan.name,
          builder: (context, state) => const ScanPage(),
        ),
        GoRoute(
          path: '/nutri-facts',
          name: Routes.nutriFacts.name,
          builder: (context, state) {
            // final extras = state.extra as Extras;
            // final barcode = extras.datas[ExtrasKey.barcode] as Barcode;
            // return NutritionFactsPage(
            //   barcode: barcode,
            // );
            return const NutritionFactsPage();
          },
        ),
        GoRoute(
          path: '/recylce',
          name: Routes.recycle.name,
          builder: (context, state) => const RecyclePage(), 
        ),
        GoRoute(
          path: '/edit-profile-page',
          name: Routes.editProfile.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final user = extras.datas[ExtrasKey.user] as User;
            return ProfileEditPage(
              user: user,
            );
          },
        ),
      ],
      errorBuilder: (context, state) => ErrorPage(
        error: state.error,
      ),
    );
  },
);
