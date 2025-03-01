import 'package:shared_preferences/shared_preferences.dart';

class OnboardingService {
  static const String _seenKey = 'onboarding_seen';
  static final _prefs = SharedPreferences.getInstance();

  static Future<void> setOnboardingAsSeen() async {
    final prefs = await _prefs;
    await prefs.setBool(_seenKey, true);
  }

  static Future<void> setOnboardingComplete() async {
    await setOnboardingAsSeen();
  }

  static Future<bool> isOnboardingSeen() async {
    final prefs = await _prefs;
    return prefs.getBool(_seenKey) ?? false;
  }
}
