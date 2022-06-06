// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return _Project.fromJson(json);
}

/// @nodoc
class _$ProjectTearOff {
  const _$ProjectTearOff();

  _Project call(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'title') required String title,
      @JsonKey(name: 'count_tasks') required int countTasks,
      @JsonKey(name: 'count_done_tasks') required int countDoneTasks,
      @JsonKey(name: 'tasks') List<Task>? tasks,
      @JsonKey(name: 'description', defaultValue: '') String description = '',
      @JsonKey(name: 'budget', defaultValue: 0.0) double budget = 0.0,
      @JsonKey(name: 'users') List<ProjectUser>? users,
      @JsonKey(name: 'admins') List<ProjectUser>? admins}) {
    return _Project(
      id: id,
      title: title,
      countTasks: countTasks,
      countDoneTasks: countDoneTasks,
      tasks: tasks,
      description: description,
      budget: budget,
      users: users,
      admins: admins,
    );
  }

  Project fromJson(Map<String, Object?> json) {
    return Project.fromJson(json);
  }
}

/// @nodoc
const $Project = _$ProjectTearOff();

/// @nodoc
mixin _$Project {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_tasks')
  int get countTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'count_done_tasks')
  int get countDoneTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'tasks')
  List<Task>? get tasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'description', defaultValue: '')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'budget', defaultValue: 0.0)
  double get budget => throw _privateConstructorUsedError;
  @JsonKey(name: 'users')
  List<ProjectUser>? get users => throw _privateConstructorUsedError;
  @JsonKey(name: 'admins')
  List<ProjectUser>? get admins => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'count_tasks') int countTasks,
      @JsonKey(name: 'count_done_tasks') int countDoneTasks,
      @JsonKey(name: 'tasks') List<Task>? tasks,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'budget', defaultValue: 0.0) double budget,
      @JsonKey(name: 'users') List<ProjectUser>? users,
      @JsonKey(name: 'admins') List<ProjectUser>? admins});
}

/// @nodoc
class _$ProjectCopyWithImpl<$Res> implements $ProjectCopyWith<$Res> {
  _$ProjectCopyWithImpl(this._value, this._then);

  final Project _value;
  // ignore: unused_field
  final $Res Function(Project) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? countTasks = freezed,
    Object? countDoneTasks = freezed,
    Object? tasks = freezed,
    Object? description = freezed,
    Object? budget = freezed,
    Object? users = freezed,
    Object? admins = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      countTasks: countTasks == freezed
          ? _value.countTasks
          : countTasks // ignore: cast_nullable_to_non_nullable
              as int,
      countDoneTasks: countDoneTasks == freezed
          ? _value.countDoneTasks
          : countDoneTasks // ignore: cast_nullable_to_non_nullable
              as int,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      budget: budget == freezed
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>?,
      admins: admins == freezed
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>?,
    ));
  }
}

/// @nodoc
abstract class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) then) =
      __$ProjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'count_tasks') int countTasks,
      @JsonKey(name: 'count_done_tasks') int countDoneTasks,
      @JsonKey(name: 'tasks') List<Task>? tasks,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'budget', defaultValue: 0.0) double budget,
      @JsonKey(name: 'users') List<ProjectUser>? users,
      @JsonKey(name: 'admins') List<ProjectUser>? admins});
}

/// @nodoc
class __$ProjectCopyWithImpl<$Res> extends _$ProjectCopyWithImpl<$Res>
    implements _$ProjectCopyWith<$Res> {
  __$ProjectCopyWithImpl(_Project _value, $Res Function(_Project) _then)
      : super(_value, (v) => _then(v as _Project));

  @override
  _Project get _value => super._value as _Project;

  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? countTasks = freezed,
    Object? countDoneTasks = freezed,
    Object? tasks = freezed,
    Object? description = freezed,
    Object? budget = freezed,
    Object? users = freezed,
    Object? admins = freezed,
  }) {
    return _then(_Project(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      countTasks: countTasks == freezed
          ? _value.countTasks
          : countTasks // ignore: cast_nullable_to_non_nullable
              as int,
      countDoneTasks: countDoneTasks == freezed
          ? _value.countDoneTasks
          : countDoneTasks // ignore: cast_nullable_to_non_nullable
              as int,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>?,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      budget: budget == freezed
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>?,
      admins: admins == freezed
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Project implements _Project {
  const _$_Project(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'count_tasks') required this.countTasks,
      @JsonKey(name: 'count_done_tasks') required this.countDoneTasks,
      @JsonKey(name: 'tasks') this.tasks,
      @JsonKey(name: 'description', defaultValue: '') this.description = '',
      @JsonKey(name: 'budget', defaultValue: 0.0) this.budget = 0.0,
      @JsonKey(name: 'users') this.users,
      @JsonKey(name: 'admins') this.admins});

  factory _$_Project.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'count_tasks')
  final int countTasks;
  @override
  @JsonKey(name: 'count_done_tasks')
  final int countDoneTasks;
  @override
  @JsonKey(name: 'tasks')
  final List<Task>? tasks;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  final String description;
  @override
  @JsonKey(name: 'budget', defaultValue: 0.0)
  final double budget;
  @override
  @JsonKey(name: 'users')
  final List<ProjectUser>? users;
  @override
  @JsonKey(name: 'admins')
  final List<ProjectUser>? admins;

  @override
  String toString() {
    return 'Project(id: $id, title: $title, countTasks: $countTasks, countDoneTasks: $countDoneTasks, tasks: $tasks, description: $description, budget: $budget, users: $users, admins: $admins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Project &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.countTasks, countTasks) &&
            const DeepCollectionEquality()
                .equals(other.countDoneTasks, countDoneTasks) &&
            const DeepCollectionEquality().equals(other.tasks, tasks) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.budget, budget) &&
            const DeepCollectionEquality().equals(other.users, users) &&
            const DeepCollectionEquality().equals(other.admins, admins));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(countTasks),
      const DeepCollectionEquality().hash(countDoneTasks),
      const DeepCollectionEquality().hash(tasks),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(budget),
      const DeepCollectionEquality().hash(users),
      const DeepCollectionEquality().hash(admins));

  @JsonKey(ignore: true)
  @override
  _$ProjectCopyWith<_Project> get copyWith =>
      __$ProjectCopyWithImpl<_Project>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectToJson(this);
  }
}

abstract class _Project implements Project {
  const factory _Project(
      {@JsonKey(name: 'id') required int id,
      @JsonKey(name: 'title') required String title,
      @JsonKey(name: 'count_tasks') required int countTasks,
      @JsonKey(name: 'count_done_tasks') required int countDoneTasks,
      @JsonKey(name: 'tasks') List<Task>? tasks,
      @JsonKey(name: 'description', defaultValue: '') String description,
      @JsonKey(name: 'budget', defaultValue: 0.0) double budget,
      @JsonKey(name: 'users') List<ProjectUser>? users,
      @JsonKey(name: 'admins') List<ProjectUser>? admins}) = _$_Project;

  factory _Project.fromJson(Map<String, dynamic> json) = _$_Project.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'count_tasks')
  int get countTasks;
  @override
  @JsonKey(name: 'count_done_tasks')
  int get countDoneTasks;
  @override
  @JsonKey(name: 'tasks')
  List<Task>? get tasks;
  @override
  @JsonKey(name: 'description', defaultValue: '')
  String get description;
  @override
  @JsonKey(name: 'budget', defaultValue: 0.0)
  double get budget;
  @override
  @JsonKey(name: 'users')
  List<ProjectUser>? get users;
  @override
  @JsonKey(name: 'admins')
  List<ProjectUser>? get admins;
  @override
  @JsonKey(ignore: true)
  _$ProjectCopyWith<_Project> get copyWith =>
      throw _privateConstructorUsedError;
}

StartProject _$StartProjectFromJson(Map<String, dynamic> json) {
  return _StartProject.fromJson(json);
}

/// @nodoc
class _$StartProjectTearOff {
  const _$StartProjectTearOff();

  _StartProject call(
      {required String title,
      required String description,
      required double budget,
      int? countTasks,
      int? countDoneTasks,
      required List<ProjectUser> users,
      required List<ProjectUser> admins}) {
    return _StartProject(
      title: title,
      description: description,
      budget: budget,
      countTasks: countTasks,
      countDoneTasks: countDoneTasks,
      users: users,
      admins: admins,
    );
  }

  StartProject fromJson(Map<String, Object?> json) {
    return StartProject.fromJson(json);
  }
}

/// @nodoc
const $StartProject = _$StartProjectTearOff();

/// @nodoc
mixin _$StartProject {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get budget => throw _privateConstructorUsedError;
  int? get countTasks => throw _privateConstructorUsedError;
  int? get countDoneTasks => throw _privateConstructorUsedError;
  List<ProjectUser> get users => throw _privateConstructorUsedError;
  List<ProjectUser> get admins => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartProjectCopyWith<StartProject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartProjectCopyWith<$Res> {
  factory $StartProjectCopyWith(
          StartProject value, $Res Function(StartProject) then) =
      _$StartProjectCopyWithImpl<$Res>;
  $Res call(
      {String title,
      String description,
      double budget,
      int? countTasks,
      int? countDoneTasks,
      List<ProjectUser> users,
      List<ProjectUser> admins});
}

/// @nodoc
class _$StartProjectCopyWithImpl<$Res> implements $StartProjectCopyWith<$Res> {
  _$StartProjectCopyWithImpl(this._value, this._then);

  final StartProject _value;
  // ignore: unused_field
  final $Res Function(StartProject) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? budget = freezed,
    Object? countTasks = freezed,
    Object? countDoneTasks = freezed,
    Object? users = freezed,
    Object? admins = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      budget: budget == freezed
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      countTasks: countTasks == freezed
          ? _value.countTasks
          : countTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      countDoneTasks: countDoneTasks == freezed
          ? _value.countDoneTasks
          : countDoneTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>,
      admins: admins == freezed
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>,
    ));
  }
}

/// @nodoc
abstract class _$StartProjectCopyWith<$Res>
    implements $StartProjectCopyWith<$Res> {
  factory _$StartProjectCopyWith(
          _StartProject value, $Res Function(_StartProject) then) =
      __$StartProjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {String title,
      String description,
      double budget,
      int? countTasks,
      int? countDoneTasks,
      List<ProjectUser> users,
      List<ProjectUser> admins});
}

/// @nodoc
class __$StartProjectCopyWithImpl<$Res> extends _$StartProjectCopyWithImpl<$Res>
    implements _$StartProjectCopyWith<$Res> {
  __$StartProjectCopyWithImpl(
      _StartProject _value, $Res Function(_StartProject) _then)
      : super(_value, (v) => _then(v as _StartProject));

  @override
  _StartProject get _value => super._value as _StartProject;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
    Object? budget = freezed,
    Object? countTasks = freezed,
    Object? countDoneTasks = freezed,
    Object? users = freezed,
    Object? admins = freezed,
  }) {
    return _then(_StartProject(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      budget: budget == freezed
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      countTasks: countTasks == freezed
          ? _value.countTasks
          : countTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      countDoneTasks: countDoneTasks == freezed
          ? _value.countDoneTasks
          : countDoneTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      users: users == freezed
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>,
      admins: admins == freezed
          ? _value.admins
          : admins // ignore: cast_nullable_to_non_nullable
              as List<ProjectUser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartProject implements _StartProject {
  const _$_StartProject(
      {required this.title,
      required this.description,
      required this.budget,
      this.countTasks,
      this.countDoneTasks,
      required this.users,
      required this.admins});

  factory _$_StartProject.fromJson(Map<String, dynamic> json) =>
      _$$_StartProjectFromJson(json);

  @override
  final String title;
  @override
  final String description;
  @override
  final double budget;
  @override
  final int? countTasks;
  @override
  final int? countDoneTasks;
  @override
  final List<ProjectUser> users;
  @override
  final List<ProjectUser> admins;

  @override
  String toString() {
    return 'StartProject(title: $title, description: $description, budget: $budget, countTasks: $countTasks, countDoneTasks: $countDoneTasks, users: $users, admins: $admins)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartProject &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description) &&
            const DeepCollectionEquality().equals(other.budget, budget) &&
            const DeepCollectionEquality()
                .equals(other.countTasks, countTasks) &&
            const DeepCollectionEquality()
                .equals(other.countDoneTasks, countDoneTasks) &&
            const DeepCollectionEquality().equals(other.users, users) &&
            const DeepCollectionEquality().equals(other.admins, admins));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description),
      const DeepCollectionEquality().hash(budget),
      const DeepCollectionEquality().hash(countTasks),
      const DeepCollectionEquality().hash(countDoneTasks),
      const DeepCollectionEquality().hash(users),
      const DeepCollectionEquality().hash(admins));

  @JsonKey(ignore: true)
  @override
  _$StartProjectCopyWith<_StartProject> get copyWith =>
      __$StartProjectCopyWithImpl<_StartProject>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StartProjectToJson(this);
  }
}

abstract class _StartProject implements StartProject {
  const factory _StartProject(
      {required String title,
      required String description,
      required double budget,
      int? countTasks,
      int? countDoneTasks,
      required List<ProjectUser> users,
      required List<ProjectUser> admins}) = _$_StartProject;

  factory _StartProject.fromJson(Map<String, dynamic> json) =
      _$_StartProject.fromJson;

  @override
  String get title;
  @override
  String get description;
  @override
  double get budget;
  @override
  int? get countTasks;
  @override
  int? get countDoneTasks;
  @override
  List<ProjectUser> get users;
  @override
  List<ProjectUser> get admins;
  @override
  @JsonKey(ignore: true)
  _$StartProjectCopyWith<_StartProject> get copyWith =>
      throw _privateConstructorUsedError;
}
