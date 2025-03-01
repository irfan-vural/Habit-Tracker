import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../domain/models/onboarding_item.dart';

class OnboardingWidget extends StatelessWidget {
  final OnboardingItem item;
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNextPressed;
  final VoidCallback onGetStartedPressed;

  const OnboardingWidget({
    super.key,
    required this.item,
    required this.currentIndex,
    required this.totalPages,
    required this.onNextPressed,
    required this.onGetStartedPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            item.imagePath,
            height: MediaQuery.of(context).size.height * 0.4,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 40),
          Text(
            item.title.tr(),
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            item.description.tr(),
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalPages,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == index
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey.shade300,
                ),
              ),
            ),
          ),
          const SizedBox(height: 32),
          _OnboardingButton(
            currentIndex: currentIndex,
            totalPages: totalPages,
            onNextPressed: onNextPressed,
            onGetStartedPressed: onGetStartedPressed,
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _OnboardingButton extends StatelessWidget {
  final int currentIndex;
  final int totalPages;
  final VoidCallback onNextPressed;
  final VoidCallback onGetStartedPressed;

  const _OnboardingButton({
    required this.currentIndex,
    required this.totalPages,
    required this.onNextPressed,
    required this.onGetStartedPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentIndex == totalPages - 1;

    return ElevatedButton(
      onPressed: isLastPage ? onGetStartedPressed : onNextPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(
        isLastPage ? 'Get Started'.tr() : 'Next'.tr(),
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
