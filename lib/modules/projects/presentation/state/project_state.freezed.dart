// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProjectStateTearOff {
  const _$ProjectStateTearOff();

  _ProjectState call(
      {bool isAllowedAdmin = false,
      Project? currentProject,
      List<Task>? tasks,
      TasksSort tasksSort = TasksSort.date,
      TasksSortByAplha tasksSortByAlpha = TasksSortByAplha.asc,
      List<Message>? messages,
      List<ProjectUser>? participants}) {
    return _ProjectState(
      isAllowedAdmin: isAllowedAdmin,
      currentProject: currentProject,
      tasks: tasks,
      tasksSort: tasksSort,
      tasksSortByAlpha: tasksSortByAlpha,
      messages: messages,
      participants: participants,
    );
  }
}

/// @nodoc
const $ProjectState = _$ProjectStateTearOff();

/// @nodoc
mixin _$ProjectState {
  bool get isAllowedAdmin => throw _privateConstructorUsedError;
  Project? get currentProject => throw _privateConstructorUsedError;
  List<Task>? get tasks => throw _privateConstructorUsedError;
  TasksSort get tasksSort => throw _privateConstructorUsedError;
  TasksSortByAplha get tasksSortByAlpha => throw _privateConstructorUsedError;
  List<Message>? get messages => throw _privateConstructorUsedError;
  List<ProjectUser>? get participants => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectStateCopyWith<ProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStateCopyWith<$Res> {
  factory $ProjectStateCopyWith(
          ProjectState value, $Res Function(ProjectState) then) =
      _$ProjectStateCopyWithImpl<$Res>;
  $Res call(
      {bool isAllowedAdmin,
      Project? currentProject,
      List<Task>? tasks,
      TasksSort tasksSort,
      TasksSortByAplha tasksSortByAlpha,
      List<Message>? messages,
      List<ProjectUser>? participants});

  $ProjectCopyWith<$Res>? get currentProject;
}

/// @nodoc
class _$ProjectStateCopyWithImpl<$Res> implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._value, this._then);

  final ProjectState _value;
  // ignore: unused_field
  final $Res Function(ProjectState) _then;

  @override
  $Res call({
    Object? isAllowedAdmin = freezed,
    Object? currentProject = freezed,
    Object? tasks = freezed,
    Object? tasksSort = freezed,
    Object? tasksSortByAlpha = freezed,
    Object? messages = freezed,
    Object? participants = freezed,
  }) {
    return _then(_value.copyWith(
      isAllowedAdmin: isAllowedAdmin == freezed
          ? _value.isAllowedAdmin
          : isAllowedAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      currentProject: currentProject == freezed
          ? _value.currentProject
          : currentProject // ignore: cast_nullable_to_non_nullable
              as Project?,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      tasksSort: tasksSort == freezed
          ? _value.tasksSort
          : tasksSort // ignore: cast_nullable_to_non_nullable
              as TasksSort,
      tasksSortByAlpha: tasksSortByAlpha == freezed
          ? _value.tasksSortByAlpha
          : tasksSortByAlpha // ignore: cast_nullable_to_non_nullable
              as TasksSortByAplha,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      participants: participants == freezed
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>?,
    ));
  }

  @override
  $ProjectCopyWith<$Res>? get currentProject {
    if (_value.currentProject == null) {
      return null;
    }

    return $ProjectCopyWith<$Res>(_value.currentProject!, (value) {
      return _then(_value.copyWith(currentProject: value));
    });
  }
}

/// @nodoc
abstract class _$ProjectStateCopyWith<$Res>
    implements $ProjectStateCopyWith<$Res> {
  factory _$ProjectStateCopyWith(
          _ProjectState value, $Res Function(_ProjectState) then) =
      __$ProjectStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isAllowedAdmin,
      Project? currentProject,
      List<Task>? tasks,
      TasksSort tasksSort,
      TasksSortByAplha tasksSortByAlpha,
      List<Message>? messages,
      List<ProjectUser>? participants});

  @override
  $ProjectCopyWith<$Res>? get currentProject;
}

/// @nodoc
class __$ProjectStateCopyWithImpl<$Res> extends _$ProjectStateCopyWithImpl<$Res>
    implements _$ProjectStateCopyWith<$Res> {
  __$ProjectStateCopyWithImpl(
      _ProjectState _value, $Res Function(_ProjectState) _then)
      : super(_value, (v) => _then(v as _ProjectState));

  @override
  _ProjectState get _value => super._value as _ProjectState;

  @override
  $Res call({
    Object? isAllowedAdmin = freezed,
    Object? currentProject = freezed,
    Object? tasks = freezed,
    Object? tasksSort = freezed,
    Object? tasksSortByAlpha = freezed,
    Object? messages = freezed,
    Object? participants = freezed,
  }) {
    return _then(_ProjectState(
      isAllowedAdmin: isAllowedAdmin == freezed
          ? _value.isAllowedAdmin
          : isAllowedAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      currentProject: currentProject == freezed
          ? _value.currentProject
          : currentProject // ignore: cast_nullable_to_non_nullable
              as Project?,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      tasksSort: tasksSort == freezed
          ? _value.tasksSort
          : tasksSort // ignore: cast_nullable_to_non_nullable
              as TasksSort,
      tasksSortByAlpha: tasksSortByAlpha == freezed
          ? _value.tasksSortByAlpha
          : tasksSortByAlpha // ignore: cast_nullable_to_non_nullable
              as TasksSortByAplha,
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      participants: participants == freezed
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>?,
    ));
  }
}

/// @nodoc

class _$_ProjectState implements _ProjectState {
  const _$_ProjectState(
      {this.isAllowedAdmin = false,
      this.currentProject,
      this.tasks,
      this.tasksSort = TasksSort.date,
      this.tasksSortByAlpha = TasksSortByAplha.asc,
      this.messages,
      this.participants});

  @JsonKey()
  @override
  final bool isAllowedAdmin;
  @override
  final Project? currentProject;
  @override
  final List<Task>? tasks;
  @JsonKey()
  @override
  final TasksSort tasksSort;
  @JsonKey()
  @override
  final TasksSortByAplha tasksSortByAlpha;
  @override
  final List<Message>? messages;
  @override
  final List<ProjectUser>? participants;

  @override
  String toString() {
    return 'ProjectState(isAllowedAdmin: $isAllowedAdmin, currentProject: $currentProject, tasks: $tasks, tasksSort: $tasksSort, tasksSortByAlpha: $tasksSortByAlpha, messages: $messages, participants: $participants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectState &&
            const DeepCollectionEquality()
                .equals(other.isAllowedAdmin, isAllowedAdmin) &&
            const DeepCollectionEquality()
                .equals(other.currentProject, currentProject) &&
            const DeepCollectionEquality().equals(other.tasks, tasks) &&
            const DeepCollectionEquality().equals(other.tasksSort, tasksSort) &&
            const DeepCollectionEquality()
                .equals(other.tasksSortByAlpha, tasksSortByAlpha) &&
            const DeepCollectionEquality().equals(other.messages, messages) &&
            const DeepCollectionEquality()
                .equals(other.participants, participants));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isAllowedAdmin),
      const DeepCollectionEquality().hash(currentProject),
      const DeepCollectionEquality().hash(tasks),
      const DeepCollectionEquality().hash(tasksSort),
      const DeepCollectionEquality().hash(tasksSortByAlpha),
      const DeepCollectionEquality().hash(messages),
      const DeepCollectionEquality().hash(participants));

  @JsonKey(ignore: true)
  @override
  _$ProjectStateCopyWith<_ProjectState> get copyWith =>
      __$ProjectStateCopyWithImpl<_ProjectState>(this, _$identity);
}

abstract class _ProjectState implements ProjectState {
  const factory _ProjectState(
      {bool isAllowedAdmin,
      Project? currentProject,
      List<Task>? tasks,
      TasksSort tasksSort,
      TasksSortByAplha tasksSortByAlpha,
      List<Message>? messages,
      List<ProjectUser>? participants}) = _$_ProjectState;

  @override
  bool get isAllowedAdmin;
  @override
  Project? get currentProject;
  @override
  List<Task>? get tasks;
  @override
  TasksSort get tasksSort;
  @override
  TasksSortByAplha get tasksSortByAlpha;
  @override
  List<Message>? get messages;
  @override
  List<ProjectUser>? get participants;
  @override
  @JsonKey(ignore: true)
  _$ProjectStateCopyWith<_ProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
