import 'package:atomic_habit_tracker/app_bloc_observer.dart';
import 'package:atomic_habit_tracker/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:atomic_habit_tracker/core/routes/app_router.dart';
import 'package:atomic_habit_tracker/core/services/onboarding_service.dart';
import 'package:atomic_habit_tracker/core/presentation/cubit/theme_cubit.dart';
import 'package:atomic_habit_tracker/features/habits/presentation/cubit/habit_list_cubit.dart';
import 'package:atomic_habit_tracker/core/services/notification_service.dart';
import 'package:atomic_habit_tracker/features/habits/data/repositories/habit_repository.dart';
import 'package:atomic_habit_tracker/core/services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await NotificationService.initialize();
  Bloc.observer = const AppBlocObserver();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final authService = AuthService();
  if (!authService.isAuthenticated) {
    await authService.signInAnonymously();
  }

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(
          create: (_) => HabitListCubit(
            repository: HabitRepository(),
          ),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('tr')],
        path: 'assets/translations',
        fallbackLocale: const Locale('en'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Routina',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          themeMode: themeMode,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF1A73E8),
              brightness: Brightness.light,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFF1A73E8),
              brightness: Brightness.dark,
              background: const Color(0xFF121212),
              surface: const Color.fromARGB(255, 3, 3, 3),
              onSurface: Colors.white.withOpacity(0.87),
              primary: const Color(0xFF4285F4),
              secondary: const Color(0xFF8AB4F8),
              error: const Color(0xFFEF5350),
            ),
            scaffoldBackgroundColor: const Color(0xFF121212),
            cardColor: const Color(0xFF1E1E1E),
            dialogBackgroundColor: const Color(0xFF1E1E1E),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color(0xFF121212),
            ),
            useMaterial3: true,
          ),
          routerConfig: appRouter,
        );
      },
    );
  }
}
