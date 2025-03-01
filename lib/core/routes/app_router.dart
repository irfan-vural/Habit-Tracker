import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:atomic_habit_tracker/features/onboarding/presentation/pages/onboarding_page.dart';
import 'package:atomic_habit_tracker/features/home/presentation/pages/home_scaffold.dart';
import 'package:atomic_habit_tracker/features/habits/presentation/pages/new_habit_page.dart';
import 'package:atomic_habit_tracker/features/habits/presentation/pages/habit_detail_page.dart';
import 'package:atomic_habit_tracker/features/splash/presentation/pages/splash_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScaffold(),
      routes: [
        GoRoute(
          path: 'new-habit',
          builder: (context, state) => const NewHabitPage(),
        ),
      ],
    ),
  ],
);
