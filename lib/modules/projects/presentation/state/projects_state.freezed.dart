// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'projects_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProjectsStateTearOff {
  const _$ProjectsStateTearOff();

  _ProjectsState call({Project? currentProject, List<Project>? projects}) {
    return _ProjectsState(
      currentProject: currentProject,
      projects: projects,
    );
  }
}

/// @nodoc
const $ProjectsState = _$ProjectsStateTearOff();

/// @nodoc
mixin _$ProjectsState {
  Project? get currentProject => throw _privateConstructorUsedError;
  List<Project>? get projects => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProjectsStateCopyWith<ProjectsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectsStateCopyWith<$Res> {
  factory $ProjectsStateCopyWith(
          ProjectsState value, $Res Function(ProjectsState) then) =
      _$ProjectsStateCopyWithImpl<$Res>;
  $Res call({Project? currentProject, List<Project>? projects});

  $ProjectCopyWith<$Res>? get currentProject;
}

/// @nodoc
class _$ProjectsStateCopyWithImpl<$Res>
    implements $ProjectsStateCopyWith<$Res> {
  _$ProjectsStateCopyWithImpl(this._value, this._then);

  final ProjectsState _value;
  // ignore: unused_field
  final $Res Function(ProjectsState) _then;

  @override
  $Res call({
    Object? currentProject = freezed,
    Object? projects = freezed,
  }) {
    return _then(_value.copyWith(
      currentProject: currentProject == freezed
          ? _value.currentProject
          : currentProject // ignore: cast_nullable_to_non_nullable
              as Project?,
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>?,
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
abstract class _$ProjectsStateCopyWith<$Res>
    implements $ProjectsStateCopyWith<$Res> {
  factory _$ProjectsStateCopyWith(
          _ProjectsState value, $Res Function(_ProjectsState) then) =
      __$ProjectsStateCopyWithImpl<$Res>;
  @override
  $Res call({Project? currentProject, List<Project>? projects});

  @override
  $ProjectCopyWith<$Res>? get currentProject;
}

/// @nodoc
class __$ProjectsStateCopyWithImpl<$Res>
    extends _$ProjectsStateCopyWithImpl<$Res>
    implements _$ProjectsStateCopyWith<$Res> {
  __$ProjectsStateCopyWithImpl(
      _ProjectsState _value, $Res Function(_ProjectsState) _then)
      : super(_value, (v) => _then(v as _ProjectsState));

  @override
  _ProjectsState get _value => super._value as _ProjectsState;

  @override
  $Res call({
    Object? currentProject = freezed,
    Object? projects = freezed,
  }) {
    return _then(_ProjectsState(
      currentProject: currentProject == freezed
          ? _value.currentProject
          : currentProject // ignore: cast_nullable_to_non_nullable
              as Project?,
      projects: projects == freezed
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>?,
    ));
  }
}

/// @nodoc

class _$_ProjectsState implements _ProjectsState {
  const _$_ProjectsState({this.currentProject, this.projects});

  @override
  final Project? currentProject;
  @override
  final List<Project>? projects;

  @override
  String toString() {
    return 'ProjectsState(currentProject: $currentProject, projects: $projects)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectsState &&
            const DeepCollectionEquality()
                .equals(other.currentProject, currentProject) &&
            const DeepCollectionEquality().equals(other.projects, projects));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(currentProject),
      const DeepCollectionEquality().hash(projects));

  @JsonKey(ignore: true)
  @override
  _$ProjectsStateCopyWith<_ProjectsState> get copyWith =>
      __$ProjectsStateCopyWithImpl<_ProjectsState>(this, _$identity);
}

abstract class _ProjectsState implements ProjectsState {
  const factory _ProjectsState(
      {Project? currentProject, List<Project>? projects}) = _$_ProjectsState;

  @override
  Project? get currentProject;
  @override
  List<Project>? get projects;
  @override
  @JsonKey(ignore: true)
  _$ProjectsStateCopyWith<_ProjectsState> get copyWith =>
      throw _privateConstructorUsedError;
}
