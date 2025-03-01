// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_list_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitListState {
  List<Habit> get habits => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  /// Create a copy of HabitListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitListStateCopyWith<HabitListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitListStateCopyWith<$Res> {
  factory $HabitListStateCopyWith(
          HabitListState value, $Res Function(HabitListState) then) =
      _$HabitListStateCopyWithImpl<$Res, HabitListState>;
  @useResult
  $Res call({List<Habit> habits, bool isLoading, String? error});
}

/// @nodoc
class _$HabitListStateCopyWithImpl<$Res, $Val extends HabitListState>
    implements $HabitListStateCopyWith<$Res> {
  _$HabitListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habits = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      habits: null == habits
          ? _value.habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitListStateImplCopyWith<$Res>
    implements $HabitListStateCopyWith<$Res> {
  factory _$$HabitListStateImplCopyWith(_$HabitListStateImpl value,
          $Res Function(_$HabitListStateImpl) then) =
      __$$HabitListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Habit> habits, bool isLoading, String? error});
}

/// @nodoc
class __$$HabitListStateImplCopyWithImpl<$Res>
    extends _$HabitListStateCopyWithImpl<$Res, _$HabitListStateImpl>
    implements _$$HabitListStateImplCopyWith<$Res> {
  __$$HabitListStateImplCopyWithImpl(
      _$HabitListStateImpl _value, $Res Function(_$HabitListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? habits = null,
    Object? isLoading = null,
    Object? error = freezed,
  }) {
    return _then(_$HabitListStateImpl(
      habits: null == habits
          ? _value._habits
          : habits // ignore: cast_nullable_to_non_nullable
              as List<Habit>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$HabitListStateImpl implements _HabitListState {
  const _$HabitListStateImpl(
      {final List<Habit> habits = const [], this.isLoading = false, this.error})
      : _habits = habits;

  final List<Habit> _habits;
  @override
  @JsonKey()
  List<Habit> get habits {
    if (_habits is EqualUnmodifiableListView) return _habits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_habits);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? error;

  @override
  String toString() {
    return 'HabitListState(habits: $habits, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitListStateImpl &&
            const DeepCollectionEquality().equals(other._habits, _habits) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_habits), isLoading, error);

  /// Create a copy of HabitListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitListStateImplCopyWith<_$HabitListStateImpl> get copyWith =>
      __$$HabitListStateImplCopyWithImpl<_$HabitListStateImpl>(
          this, _$identity);
}

abstract class _HabitListState implements HabitListState {
  const factory _HabitListState(
      {final List<Habit> habits,
      final bool isLoading,
      final String? error}) = _$HabitListStateImpl;

  @override
  List<Habit> get habits;
  @override
  bool get isLoading;
  @override
  String? get error;

  /// Create a copy of HabitListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitListStateImplCopyWith<_$HabitListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
