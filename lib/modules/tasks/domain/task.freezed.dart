// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _Task.fromJson(json);
}

/// @nodoc
class _$TaskTearOff {
  const _$TaskTearOff();

  _Task call(
      {int? id,
      required String title,
      required String description,
      required ProjectUser creator,
      required ProjectUser performer,
      @JsonKey(name: 'is_done')
          bool isDone = false,
      @JsonKey(fromJson: Task.priorityFromJson)
          TaskPriority priority = TaskPriority.nonUrgent,
      required double cost}) {
    return _Task(
      id: id,
      title: title,
      description: description,
      creator: creator,
      performer: performer,
      isDone: isDone,
      priority: priority,
      cost: cost,
    );
  }

  Task fromJson(Map<String, Object?> json) {
    return Task.fromJson(json);
  }
}

/// @nodoc
const $Task = _$TaskTearOff();

/// @nodoc
mixin _$Task {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ProjectUser get creator => throw _privateConstructorUsedError;
  ProjectUser get performer => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_done')
  bool get isDone => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Task.priorityFromJson)
  TaskPriority get priority => throw _privateConstructorUsedError;
  double get cost => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call(
      {int? id,
      String title,
      String description,
      ProjectUser creator,
      ProjectUser performer,
      @JsonKey(name: 'is_done') bool isDone,
      @JsonKey(fromJson: Task.priorityFromJson) TaskPriority priority,
      double cost});

  $ProjectUserCopyWith<$Res> get creator;
  $ProjectUserCopyWith<$Res> get performer;
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? creator = freezed,
    Object? performer = freezed,
    Object? isDone = freezed,
    Object? priority = freezed,
    Object? cost = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as ProjectUser,
      performer: performer == freezed
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as ProjectUser,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $ProjectUserCopyWith<$Res> get creator {
    return $ProjectUserCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value));
    });
  }

  @override
  $ProjectUserCopyWith<$Res> get performer {
    return $ProjectUserCopyWith<$Res>(_value.performer, (value) {
      return _then(_value.copyWith(performer: value));
    });
  }
}

/// @nodoc
abstract class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) then) =
      __$TaskCopyWithImpl<$Res>;
  @override
  $Res call(
      {int? id,
      String title,
      String description,
      ProjectUser creator,
      ProjectUser performer,
      @JsonKey(name: 'is_done') bool isDone,
      @JsonKey(fromJson: Task.priorityFromJson) TaskPriority priority,
      double cost});

  @override
  $ProjectUserCopyWith<$Res> get creator;
  @override
  $ProjectUserCopyWith<$Res> get performer;
}

/// @nodoc
class __$TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(_Task _value, $Res Function(_Task) _then)
      : super(_value, (v) => _then(v as _Task));

  @override
  _Task get _value => super._value as _Task;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? creator = freezed,
    Object? performer = freezed,
    Object? isDone = freezed,
    Object? priority = freezed,
    Object? cost = freezed,
  }) {
    return _then(_Task(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as ProjectUser,
      performer: performer == freezed
          ? _value.performer
          : performer // ignore: cast_nullable_to_non_nullable
              as ProjectUser,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      priority: priority == freezed
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority,
      cost: cost == freezed
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Task implements _Task {
  const _$_Task(
      {this.id,
      required this.title,
      required this.description,
      required this.creator,
      required this.performer,
      @JsonKey(name: 'is_done')
          this.isDone = false,
      @JsonKey(fromJson: Task.priorityFromJson)
          this.priority = TaskPriority.nonUrgent,
      required this.cost});

  factory _$_Task.fromJson(Map<String, dynamic> json) => _$$_TaskFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String description;
  @override
  final ProjectUser creator;
  @override
  final ProjectUser performer;
  @override
  @JsonKey(name: 'is_done')
  final bool isDone;
  @override
  @JsonKey(fromJson: Task.priorityFromJson)
  final TaskPriority priority;
  @override
  final double cost;

  @override
  String toString() {
    return 'Task(id: $id, title: $title, description: $description, creator: $creator, performer: $performer, isDone: $isDone, priority: $priority, cost: $cost)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Task &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.creator, creator) &&
            const DeepCollectionEquality().equals(other.performer, performer) &&
            const DeepCollectionEquality().equals(other.isDone, isDone) &&
            const DeepCollectionEquality().equals(other.priority, priority) &&
            const DeepCollectionEquality().equals(other.cost, cost));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(creator),
      const DeepCollectionEquality().hash(performer),
      const DeepCollectionEquality().hash(isDone),
      const DeepCollectionEquality().hash(priority),
      const DeepCollectionEquality().hash(cost));

  @JsonKey(ignore: true)
  @override
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskToJson(this);
  }
}

abstract class _Task implements Task {
  const factory _Task(
      {int? id,
      required String title,
      required String description,
      required ProjectUser creator,
      required ProjectUser performer,
      @JsonKey(name: 'is_done') bool isDone,
      @JsonKey(fromJson: Task.priorityFromJson) TaskPriority priority,
      required double cost}) = _$_Task;

  factory _Task.fromJson(Map<String, dynamic> json) = _$_Task.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String get description;
  @override
  ProjectUser get creator;
  @override
  ProjectUser get performer;
  @override
  @JsonKey(name: 'is_done')
  bool get isDone;
  @override
  @JsonKey(fromJson: Task.priorityFromJson)
  TaskPriority get priority;
  @override
  double get cost;
  @override
  @JsonKey(ignore: true)
  _$TaskCopyWith<_Task> get copyWith => throw _privateConstructorUsedError;
}
