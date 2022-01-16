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
      {@JsonKey(name: 'project_id') required int id,
      @JsonKey(name: 'project_title') required String title,
      @JsonKey(name: 'project_count_tasks') required int countTasks,
      @JsonKey(name: 'project_count_done_tasks') required int countDoneTasks,
      @JsonKey(name: 'project_participants') Set<ProjectUser>? participants,
      @JsonKey(name: 'project_creator') ProjectUser? creator}) {
    return _Project(
      id: id,
      title: title,
      countTasks: countTasks,
      countDoneTasks: countDoneTasks,
      participants: participants,
      creator: creator,
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
  @JsonKey(name: 'project_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_count_tasks')
  int get countTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_count_done_tasks')
  int get countDoneTasks => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_participants')
  Set<ProjectUser>? get participants => throw _privateConstructorUsedError;
  @JsonKey(name: 'project_creator')
  ProjectUser? get creator => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectCopyWith<Project> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectCopyWith<$Res> {
  factory $ProjectCopyWith(Project value, $Res Function(Project) then) =
      _$ProjectCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'project_id') int id,
      @JsonKey(name: 'project_title') String title,
      @JsonKey(name: 'project_count_tasks') int countTasks,
      @JsonKey(name: 'project_count_done_tasks') int countDoneTasks,
      @JsonKey(name: 'project_participants') Set<ProjectUser>? participants,
      @JsonKey(name: 'project_creator') ProjectUser? creator});

  $ProjectUserCopyWith<$Res>? get creator;
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
    Object? participants = freezed,
    Object? creator = freezed,
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
      participants: participants == freezed
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as Set<ProjectUser>?,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as ProjectUser?,
    ));
  }

  @override
  $ProjectUserCopyWith<$Res>? get creator {
    if (_value.creator == null) {
      return null;
    }

    return $ProjectUserCopyWith<$Res>(_value.creator!, (value) {
      return _then(_value.copyWith(creator: value));
    });
  }
}

/// @nodoc
abstract class _$ProjectCopyWith<$Res> implements $ProjectCopyWith<$Res> {
  factory _$ProjectCopyWith(_Project value, $Res Function(_Project) then) =
      __$ProjectCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'project_id') int id,
      @JsonKey(name: 'project_title') String title,
      @JsonKey(name: 'project_count_tasks') int countTasks,
      @JsonKey(name: 'project_count_done_tasks') int countDoneTasks,
      @JsonKey(name: 'project_participants') Set<ProjectUser>? participants,
      @JsonKey(name: 'project_creator') ProjectUser? creator});

  @override
  $ProjectUserCopyWith<$Res>? get creator;
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
    Object? participants = freezed,
    Object? creator = freezed,
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
      participants: participants == freezed
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as Set<ProjectUser>?,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as ProjectUser?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Project implements _Project {
  const _$_Project(
      {@JsonKey(name: 'project_id') required this.id,
      @JsonKey(name: 'project_title') required this.title,
      @JsonKey(name: 'project_count_tasks') required this.countTasks,
      @JsonKey(name: 'project_count_done_tasks') required this.countDoneTasks,
      @JsonKey(name: 'project_participants') this.participants,
      @JsonKey(name: 'project_creator') this.creator});

  factory _$_Project.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectFromJson(json);

  @override
  @JsonKey(name: 'project_id')
  final int id;
  @override
  @JsonKey(name: 'project_title')
  final String title;
  @override
  @JsonKey(name: 'project_count_tasks')
  final int countTasks;
  @override
  @JsonKey(name: 'project_count_done_tasks')
  final int countDoneTasks;
  @override
  @JsonKey(name: 'project_participants')
  final Set<ProjectUser>? participants;
  @override
  @JsonKey(name: 'project_creator')
  final ProjectUser? creator;

  @override
  String toString() {
    return 'Project(id: $id, title: $title, countTasks: $countTasks, countDoneTasks: $countDoneTasks, participants: $participants, creator: $creator)';
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
            const DeepCollectionEquality()
                .equals(other.participants, participants) &&
            const DeepCollectionEquality().equals(other.creator, creator));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(countTasks),
      const DeepCollectionEquality().hash(countDoneTasks),
      const DeepCollectionEquality().hash(participants),
      const DeepCollectionEquality().hash(creator));

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
      {@JsonKey(name: 'project_id') required int id,
      @JsonKey(name: 'project_title') required String title,
      @JsonKey(name: 'project_count_tasks') required int countTasks,
      @JsonKey(name: 'project_count_done_tasks') required int countDoneTasks,
      @JsonKey(name: 'project_participants') Set<ProjectUser>? participants,
      @JsonKey(name: 'project_creator') ProjectUser? creator}) = _$_Project;

  factory _Project.fromJson(Map<String, dynamic> json) = _$_Project.fromJson;

  @override
  @JsonKey(name: 'project_id')
  int get id;
  @override
  @JsonKey(name: 'project_title')
  String get title;
  @override
  @JsonKey(name: 'project_count_tasks')
  int get countTasks;
  @override
  @JsonKey(name: 'project_count_done_tasks')
  int get countDoneTasks;
  @override
  @JsonKey(name: 'project_participants')
  Set<ProjectUser>? get participants;
  @override
  @JsonKey(name: 'project_creator')
  ProjectUser? get creator;
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
      int? countTasks,
      int? countDoneTasks,
      required Set<ProjectUser> participants,
      required ProjectUser creator}) {
    return _StartProject(
      title: title,
      countTasks: countTasks,
      countDoneTasks: countDoneTasks,
      participants: participants,
      creator: creator,
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
  int? get countTasks => throw _privateConstructorUsedError;
  int? get countDoneTasks => throw _privateConstructorUsedError;
  Set<ProjectUser> get participants => throw _privateConstructorUsedError;
  ProjectUser get creator => throw _privateConstructorUsedError;

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
      int? countTasks,
      int? countDoneTasks,
      Set<ProjectUser> participants,
      ProjectUser creator});

  $ProjectUserCopyWith<$Res> get creator;
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
    Object? countTasks = freezed,
    Object? countDoneTasks = freezed,
    Object? participants = freezed,
    Object? creator = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      countTasks: countTasks == freezed
          ? _value.countTasks
          : countTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      countDoneTasks: countDoneTasks == freezed
          ? _value.countDoneTasks
          : countDoneTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      participants: participants == freezed
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as Set<ProjectUser>,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as ProjectUser,
    ));
  }

  @override
  $ProjectUserCopyWith<$Res> get creator {
    return $ProjectUserCopyWith<$Res>(_value.creator, (value) {
      return _then(_value.copyWith(creator: value));
    });
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
      int? countTasks,
      int? countDoneTasks,
      Set<ProjectUser> participants,
      ProjectUser creator});

  @override
  $ProjectUserCopyWith<$Res> get creator;
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
    Object? countTasks = freezed,
    Object? countDoneTasks = freezed,
    Object? participants = freezed,
    Object? creator = freezed,
  }) {
    return _then(_StartProject(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      countTasks: countTasks == freezed
          ? _value.countTasks
          : countTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      countDoneTasks: countDoneTasks == freezed
          ? _value.countDoneTasks
          : countDoneTasks // ignore: cast_nullable_to_non_nullable
              as int?,
      participants: participants == freezed
          ? _value.participants
          : participants // ignore: cast_nullable_to_non_nullable
              as Set<ProjectUser>,
      creator: creator == freezed
          ? _value.creator
          : creator // ignore: cast_nullable_to_non_nullable
              as ProjectUser,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StartProject implements _StartProject {
  const _$_StartProject(
      {required this.title,
      this.countTasks,
      this.countDoneTasks,
      required this.participants,
      required this.creator});

  factory _$_StartProject.fromJson(Map<String, dynamic> json) =>
      _$$_StartProjectFromJson(json);

  @override
  final String title;
  @override
  final int? countTasks;
  @override
  final int? countDoneTasks;
  @override
  final Set<ProjectUser> participants;
  @override
  final ProjectUser creator;

  @override
  String toString() {
    return 'StartProject(title: $title, countTasks: $countTasks, countDoneTasks: $countDoneTasks, participants: $participants, creator: $creator)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StartProject &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.countTasks, countTasks) &&
            const DeepCollectionEquality()
                .equals(other.countDoneTasks, countDoneTasks) &&
            const DeepCollectionEquality()
                .equals(other.participants, participants) &&
            const DeepCollectionEquality().equals(other.creator, creator));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(countTasks),
      const DeepCollectionEquality().hash(countDoneTasks),
      const DeepCollectionEquality().hash(participants),
      const DeepCollectionEquality().hash(creator));

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
      int? countTasks,
      int? countDoneTasks,
      required Set<ProjectUser> participants,
      required ProjectUser creator}) = _$_StartProject;

  factory _StartProject.fromJson(Map<String, dynamic> json) =
      _$_StartProject.fromJson;

  @override
  String get title;
  @override
  int? get countTasks;
  @override
  int? get countDoneTasks;
  @override
  Set<ProjectUser> get participants;
  @override
  ProjectUser get creator;
  @override
  @JsonKey(ignore: true)
  _$StartProjectCopyWith<_StartProject> get copyWith =>
      throw _privateConstructorUsedError;
}
