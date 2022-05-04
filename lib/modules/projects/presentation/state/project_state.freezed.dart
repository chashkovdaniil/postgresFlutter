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
      List<Message>? messages}) {
    return _ProjectState(
      isAllowedAdmin: isAllowedAdmin,
      currentProject: currentProject,
      messages: messages,
    );
  }
}

/// @nodoc
const $ProjectState = _$ProjectStateTearOff();

/// @nodoc
mixin _$ProjectState {
  bool get isAllowedAdmin => throw _privateConstructorUsedError;
  Project? get currentProject => throw _privateConstructorUsedError;
  List<Message>? get messages => throw _privateConstructorUsedError;

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
      {bool isAllowedAdmin, Project? currentProject, List<Message>? messages});

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
    Object? messages = freezed,
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
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
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
      {bool isAllowedAdmin, Project? currentProject, List<Message>? messages});

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
    Object? messages = freezed,
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
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
    ));
  }
}

/// @nodoc

class _$_ProjectState implements _ProjectState {
  const _$_ProjectState(
      {this.isAllowedAdmin = false, this.currentProject, this.messages});

  @JsonKey()
  @override
  final bool isAllowedAdmin;
  @override
  final Project? currentProject;
  @override
  final List<Message>? messages;

  @override
  String toString() {
    return 'ProjectState(isAllowedAdmin: $isAllowedAdmin, currentProject: $currentProject, messages: $messages)';
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
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isAllowedAdmin),
      const DeepCollectionEquality().hash(currentProject),
      const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  _$ProjectStateCopyWith<_ProjectState> get copyWith =>
      __$ProjectStateCopyWithImpl<_ProjectState>(this, _$identity);
}

abstract class _ProjectState implements ProjectState {
  const factory _ProjectState(
      {bool isAllowedAdmin,
      Project? currentProject,
      List<Message>? messages}) = _$_ProjectState;

  @override
  bool get isAllowedAdmin;
  @override
  Project? get currentProject;
  @override
  List<Message>? get messages;
  @override
  @JsonKey(ignore: true)
  _$ProjectStateCopyWith<_ProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}
