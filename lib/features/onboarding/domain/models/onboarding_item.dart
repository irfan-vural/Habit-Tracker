import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_item.g.dart';

part 'onboarding_item.freezed.dart';

@freezed
class OnboardingItem with _$OnboardingItem {
  const factory OnboardingItem({
    required String title,
    required String description,
    required String imagePath,
  }) = _OnboardingItem;

  factory OnboardingItem.fromJson(Map<String, dynamic> json) =>
      _$OnboardingItemFromJson(json);
}
