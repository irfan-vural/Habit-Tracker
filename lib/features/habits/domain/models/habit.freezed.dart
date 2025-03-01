// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Habit _$HabitFromJson(Map<String, dynamic> json) {
  return _Habit.fromJson(json);
}

/// @nodoc
mixin _$Habit {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int get dailyCompletionGoal => throw _privateConstructorUsedError;
  int get dailyProgress => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  Color get color => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _iconDataFromJson, toJson: _iconDataToJson)
  IconData get icon => throw _privateConstructorUsedError;
  bool get enableNotifications => throw _privateConstructorUsedError;
  DateTime? get notificationTime => throw _privateConstructorUsedError;
  bool get isArchived => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  List<DateTime> get completedDates => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  int get bestStreak => throw _privateConstructorUsedError;
  int get totalCompletions => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Habit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res, Habit>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      int dailyCompletionGoal,
      int dailyProgress,
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson) Color color,
      @JsonKey(fromJson: _iconDataFromJson, toJson: _iconDataToJson)
      IconData icon,
      bool enableNotifications,
      DateTime? notificationTime,
      bool isArchived,
      bool isDeleted,
      int order,
      List<DateTime> completedDates,
      int currentStreak,
      int bestStreak,
      int totalCompletions,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res, $Val extends Habit>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? dailyCompletionGoal = null,
    Object? dailyProgress = null,
    Object? color = null,
    Object? icon = null,
    Object? enableNotifications = null,
    Object? notificationTime = freezed,
    Object? isArchived = null,
    Object? isDeleted = null,
    Object? order = null,
    Object? completedDates = null,
    Object? currentStreak = null,
    Object? bestStreak = null,
    Object? totalCompletions = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyCompletionGoal: null == dailyCompletionGoal
          ? _value.dailyCompletionGoal
          : dailyCompletionGoal // ignore: cast_nullable_to_non_nullable
              as int,
      dailyProgress: null == dailyProgress
          ? _value.dailyProgress
          : dailyProgress // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      enableNotifications: null == enableNotifications
          ? _value.enableNotifications
          : enableNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTime: freezed == notificationTime
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      completedDates: null == completedDates
          ? _value.completedDates
          : completedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreak: null == bestStreak
          ? _value.bestStreak
          : bestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      totalCompletions: null == totalCompletions
          ? _value.totalCompletions
          : totalCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitImplCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$$HabitImplCopyWith(
          _$HabitImpl value, $Res Function(_$HabitImpl) then) =
      __$$HabitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      int dailyCompletionGoal,
      int dailyProgress,
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson) Color color,
      @JsonKey(fromJson: _iconDataFromJson, toJson: _iconDataToJson)
      IconData icon,
      bool enableNotifications,
      DateTime? notificationTime,
      bool isArchived,
      bool isDeleted,
      int order,
      List<DateTime> completedDates,
      int currentStreak,
      int bestStreak,
      int totalCompletions,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$HabitImplCopyWithImpl<$Res>
    extends _$HabitCopyWithImpl<$Res, _$HabitImpl>
    implements _$$HabitImplCopyWith<$Res> {
  __$$HabitImplCopyWithImpl(
      _$HabitImpl _value, $Res Function(_$HabitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? dailyCompletionGoal = null,
    Object? dailyProgress = null,
    Object? color = null,
    Object? icon = null,
    Object? enableNotifications = null,
    Object? notificationTime = freezed,
    Object? isArchived = null,
    Object? isDeleted = null,
    Object? order = null,
    Object? completedDates = null,
    Object? currentStreak = null,
    Object? bestStreak = null,
    Object? totalCompletions = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$HabitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyCompletionGoal: null == dailyCompletionGoal
          ? _value.dailyCompletionGoal
          : dailyCompletionGoal // ignore: cast_nullable_to_non_nullable
              as int,
      dailyProgress: null == dailyProgress
          ? _value.dailyProgress
          : dailyProgress // ignore: cast_nullable_to_non_nullable
              as int,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      enableNotifications: null == enableNotifications
          ? _value.enableNotifications
          : enableNotifications // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTime: freezed == notificationTime
          ? _value.notificationTime
          : notificationTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isArchived: null == isArchived
          ? _value.isArchived
          : isArchived // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      completedDates: null == completedDates
          ? _value._completedDates
          : completedDates // ignore: cast_nullable_to_non_nullable
              as List<DateTime>,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      bestStreak: null == bestStreak
          ? _value.bestStreak
          : bestStreak // ignore: cast_nullable_to_non_nullable
              as int,
      totalCompletions: null == totalCompletions
          ? _value.totalCompletions
          : totalCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitImpl implements _Habit {
  const _$HabitImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.dailyCompletionGoal,
      this.dailyProgress = 0,
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
      required this.color,
      @JsonKey(fromJson: _iconDataFromJson, toJson: _iconDataToJson)
      required this.icon,
      required this.enableNotifications,
      this.notificationTime,
      this.isArchived = false,
      this.isDeleted = false,
      this.order = 0,
      final List<DateTime> completedDates = const [],
      this.currentStreak = 0,
      this.bestStreak = 0,
      this.totalCompletions = 0,
      required this.createdAt,
      required this.updatedAt})
      : _completedDates = completedDates;

  factory _$HabitImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final int dailyCompletionGoal;
  @override
  @JsonKey()
  final int dailyProgress;
  @override
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  final Color color;
  @override
  @JsonKey(fromJson: _iconDataFromJson, toJson: _iconDataToJson)
  final IconData icon;
  @override
  final bool enableNotifications;
  @override
  final DateTime? notificationTime;
  @override
  @JsonKey()
  final bool isArchived;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  @JsonKey()
  final int order;
  final List<DateTime> _completedDates;
  @override
  @JsonKey()
  List<DateTime> get completedDates {
    if (_completedDates is EqualUnmodifiableListView) return _completedDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedDates);
  }

  @override
  @JsonKey()
  final int currentStreak;
  @override
  @JsonKey()
  final int bestStreak;
  @override
  @JsonKey()
  final int totalCompletions;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Habit(id: $id, name: $name, description: $description, dailyCompletionGoal: $dailyCompletionGoal, dailyProgress: $dailyProgress, color: $color, icon: $icon, enableNotifications: $enableNotifications, notificationTime: $notificationTime, isArchived: $isArchived, isDeleted: $isDeleted, order: $order, completedDates: $completedDates, currentStreak: $currentStreak, bestStreak: $bestStreak, totalCompletions: $totalCompletions, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dailyCompletionGoal, dailyCompletionGoal) ||
                other.dailyCompletionGoal == dailyCompletionGoal) &&
            (identical(other.dailyProgress, dailyProgress) ||
                other.dailyProgress == dailyProgress) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.enableNotifications, enableNotifications) ||
                other.enableNotifications == enableNotifications) &&
            (identical(other.notificationTime, notificationTime) ||
                other.notificationTime == notificationTime) &&
            (identical(other.isArchived, isArchived) ||
                other.isArchived == isArchived) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality()
                .equals(other._completedDates, _completedDates) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.bestStreak, bestStreak) ||
                other.bestStreak == bestStreak) &&
            (identical(other.totalCompletions, totalCompletions) ||
                other.totalCompletions == totalCompletions) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      dailyCompletionGoal,
      dailyProgress,
      color,
      icon,
      enableNotifications,
      notificationTime,
      isArchived,
      isDeleted,
      order,
      const DeepCollectionEquality().hash(_completedDates),
      currentStreak,
      bestStreak,
      totalCompletions,
      createdAt,
      updatedAt);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      __$$HabitImplCopyWithImpl<_$HabitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitImplToJson(
      this,
    );
  }
}

abstract class _Habit implements Habit {
  const factory _Habit(
      {required final String id,
      required final String name,
      final String? description,
      required final int dailyCompletionGoal,
      final int dailyProgress,
      @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
      required final Color color,
      @JsonKey(fromJson: _iconDataFromJson, toJson: _iconDataToJson)
      required final IconData icon,
      required final bool enableNotifications,
      final DateTime? notificationTime,
      final bool isArchived,
      final bool isDeleted,
      final int order,
      final List<DateTime> completedDates,
      final int currentStreak,
      final int bestStreak,
      final int totalCompletions,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$HabitImpl;

  factory _Habit.fromJson(Map<String, dynamic> json) = _$HabitImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  int get dailyCompletionGoal;
  @override
  int get dailyProgress;
  @override
  @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
  Color get color;
  @override
  @JsonKey(fromJson: _iconDataFromJson, toJson: _iconDataToJson)
  IconData get icon;
  @override
  bool get enableNotifications;
  @override
  DateTime? get notificationTime;
  @override
  bool get isArchived;
  @override
  bool get isDeleted;
  @override
  int get order;
  @override
  List<DateTime> get completedDates;
  @override
  int get currentStreak;
  @override
  int get bestStreak;
  @override
  int get totalCompletions;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
