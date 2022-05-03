// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'messages_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MessagesStateTearOff {
  const _$MessagesStateTearOff();

  _MessagesState call({required List<Message> messages}) {
    return _MessagesState(
      messages: messages,
    );
  }
}

/// @nodoc
const $MessagesState = _$MessagesStateTearOff();

/// @nodoc
mixin _$MessagesState {
  List<Message> get messages => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MessagesStateCopyWith<MessagesState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesStateCopyWith<$Res> {
  factory $MessagesStateCopyWith(
          MessagesState value, $Res Function(MessagesState) then) =
      _$MessagesStateCopyWithImpl<$Res>;
  $Res call({List<Message> messages});
}

/// @nodoc
class _$MessagesStateCopyWithImpl<$Res>
    implements $MessagesStateCopyWith<$Res> {
  _$MessagesStateCopyWithImpl(this._value, this._then);

  final MessagesState _value;
  // ignore: unused_field
  final $Res Function(MessagesState) _then;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
abstract class _$MessagesStateCopyWith<$Res>
    implements $MessagesStateCopyWith<$Res> {
  factory _$MessagesStateCopyWith(
          _MessagesState value, $Res Function(_MessagesState) then) =
      __$MessagesStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Message> messages});
}

/// @nodoc
class __$MessagesStateCopyWithImpl<$Res>
    extends _$MessagesStateCopyWithImpl<$Res>
    implements _$MessagesStateCopyWith<$Res> {
  __$MessagesStateCopyWithImpl(
      _MessagesState _value, $Res Function(_MessagesState) _then)
      : super(_value, (v) => _then(v as _MessagesState));

  @override
  _MessagesState get _value => super._value as _MessagesState;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_MessagesState(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc

class _$_MessagesState implements _MessagesState {
  const _$_MessagesState({required this.messages});

  @override
  final List<Message> messages;

  @override
  String toString() {
    return 'MessagesState(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MessagesState &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  _$MessagesStateCopyWith<_MessagesState> get copyWith =>
      __$MessagesStateCopyWithImpl<_MessagesState>(this, _$identity);
}

abstract class _MessagesState implements MessagesState {
  const factory _MessagesState({required List<Message> messages}) =
      _$_MessagesState;

  @override
  List<Message> get messages;
  @override
  @JsonKey(ignore: true)
  _$MessagesStateCopyWith<_MessagesState> get copyWith =>
      throw _privateConstructorUsedError;
}
