import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geats/src/features/analyze/presentation/add_meal_page.dart';
import 'package:geats/src/features/common/presentation/question/question_page.dart';
import 'package:geats/src/features/recycle/presentation/add_recycle_page.dart';
import 'package:geats/src/features/recycle/presentation/location_recycle_page.dart';
import 'package:geats/src/features/recycle/presentation/recycle_page.dart';
import 'package:geats/src/features/recycle/presentation/tutorial_recycle_page.dart';
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
  question,
  botNavBar,
  scan,
  nutriFacts,
  recycle,
  editProfile,
  addMeal,
  addRecycle,
  locationRecycle,
  tutorialRecycle,
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
          path: '/question',
          name: Routes.question.name,
          builder: (context, state) => const QuestionPage(),
        ),
        GoRoute(
          path: '/botnavbar',
          name: Routes.botNavBar.name,
          builder: (context, state) => const BotNavBarPage(),
        ),
        GoRoute(
          path: '/scan',
          name: Routes.scan.name,
          builder: (context, state) {
            final extras = state.extra as Extras;
            final isCompare = extras.datas[ExtrasKey.isCompare] as bool;
            return ScanPage(
              isCompare: isCompare,
            );
          },
        ),
        GoRoute(
          path: '/nutri-facts',
          name: Routes.nutriFacts.name,
          builder: (context, state) => const NutritionFactsPage(),
        ),
        GoRoute(
          path: '/add-meal',
          name: Routes.addMeal.name,
          builder: (context, state) => const AddMealPage(),
        ),
        GoRoute(
          path: '/recylce',
          name: Routes.recycle.name,
          builder: (context, state) => const RecyclePage(),
        ),
        GoRoute(
          path: '/add-recycle',
          name: Routes.addRecycle.name,
          builder: (context, state) => const AddRecyclePage(),
        ),
        GoRoute(
          path: '/location-recycle',
          name: Routes.locationRecycle.name,
          builder: (context, state) => const LocationRecyclePage(),
        ),
        GoRoute(
          path: '/tutorial-recycle',
          name: Routes.tutorialRecycle.name,
          builder: (context, state) => const TutorialRecyclePage(),
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
