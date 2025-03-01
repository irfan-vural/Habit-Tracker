// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OnboardingItem _$OnboardingItemFromJson(Map<String, dynamic> json) {
  return _OnboardingItem.fromJson(json);
}

/// @nodoc
mixin _$OnboardingItem {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;

  /// Serializes this OnboardingItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OnboardingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OnboardingItemCopyWith<OnboardingItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingItemCopyWith<$Res> {
  factory $OnboardingItemCopyWith(
          OnboardingItem value, $Res Function(OnboardingItem) then) =
      _$OnboardingItemCopyWithImpl<$Res, OnboardingItem>;
  @useResult
  $Res call({String title, String description, String imagePath});
}

/// @nodoc
class _$OnboardingItemCopyWithImpl<$Res, $Val extends OnboardingItem>
    implements $OnboardingItemCopyWith<$Res> {
  _$OnboardingItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OnboardingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? imagePath = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OnboardingItemImplCopyWith<$Res>
    implements $OnboardingItemCopyWith<$Res> {
  factory _$$OnboardingItemImplCopyWith(_$OnboardingItemImpl value,
          $Res Function(_$OnboardingItemImpl) then) =
      __$$OnboardingItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String description, String imagePath});
}

/// @nodoc
class __$$OnboardingItemImplCopyWithImpl<$Res>
    extends _$OnboardingItemCopyWithImpl<$Res, _$OnboardingItemImpl>
    implements _$$OnboardingItemImplCopyWith<$Res> {
  __$$OnboardingItemImplCopyWithImpl(
      _$OnboardingItemImpl _value, $Res Function(_$OnboardingItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of OnboardingItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? imagePath = null,
  }) {
    return _then(_$OnboardingItemImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OnboardingItemImpl implements _OnboardingItem {
  const _$OnboardingItemImpl(
      {required this.title,
      required this.description,
      required this.imagePath});

  factory _$OnboardingItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$OnboardingItemImplFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final String imagePath;

  @override
  String toString() {
    return 'OnboardingItem(title: $title, description: $description, imagePath: $imagePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnboardingItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, imagePath);

  /// Create a copy of OnboardingItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnboardingItemImplCopyWith<_$OnboardingItemImpl> get copyWith =>
      __$$OnboardingItemImplCopyWithImpl<_$OnboardingItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OnboardingItemImplToJson(
      this,
    );
  }
}

abstract class _OnboardingItem implements OnboardingItem {
  const factory _OnboardingItem(
      {required final String title,
      required final String description,
      required final String imagePath}) = _$OnboardingItemImpl;

  factory _OnboardingItem.fromJson(Map<String, dynamic> json) =
      _$OnboardingItemImpl.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  String get imagePath;

  /// Create a copy of OnboardingItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnboardingItemImplCopyWith<_$OnboardingItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
