import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:go_router/go_router.dart';
import 'package:atomic_habit_tracker/core/services/onboarding_service.dart';
import 'package:atomic_habit_tracker/core/widgets/logo_widget.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _currentFeatureIndex = 0;
  final _features = [
    _Feature(
      icon: Icons.track_changes,
      title: 'Track Daily Progress'.tr(),
      description:
          'Monitor your habits and see your improvement over time'.tr(),
    ),
    _Feature(
      icon: Icons.notifications_active,
      title: 'Smart Reminders'.tr(),
      description:
          'Get notified at the right time to maintain your habits'.tr(),
    ),
    _Feature(
      icon: Icons.insights,
      title: 'Detailed Analytics'.tr(),
      description: 'Visualize your progress with detailed statistics'.tr(),
    ),
  ];

  void _nextFeature() {
    if (_currentFeatureIndex < _features.length - 1) {
      setState(() {
        _currentFeatureIndex++;
      });
    } else {
      _onGetStarted();
    }
  }

  Future<void> _onGetStarted() async {
    await OnboardingService.setOnboardingAsSeen();
    if (mounted) {
      context.go('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  Theme.of(context).colorScheme.surface,
                ],
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const LogoWidget(size: 64),
                  const SizedBox(height: 32),
                  Text(
                    'Build Better Habits\nOne Step at a Time'.tr(),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          height: 1.2,
                        ),
                  ),
                  const SizedBox(height: 32),
                  Column(
                    children: List.generate(
                      _features.length,
                      (index) => AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: index <= _currentFeatureIndex ? 1.0 : 0.0,
                        child: AnimatedSlide(
                          duration: const Duration(milliseconds: 500),
                          offset: index <= _currentFeatureIndex
                              ? Offset.zero
                              : const Offset(0, 0.1),
                          child: index <= _currentFeatureIndex
                              ? _buildFeatureItem(
                                  context,
                                  icon: _features[index].icon,
                                  title: _features[index].title,
                                  description: _features[index].description,
                                )
                              : const SizedBox.shrink(),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: List.generate(
                      _features.length,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 8),
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: index == _currentFeatureIndex
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: _nextFeature,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        _currentFeatureIndex == _features.length - 1
                            ? 'Get Started'.tr()
                            : 'Next'.tr(),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.tr(),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  description.tr(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).textTheme.bodySmall?.color,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Feature {
  final IconData icon;
  final String title;
  final String description;

  const _Feature({
    required this.icon,
    required this.title,
    required this.description,
  });
}
