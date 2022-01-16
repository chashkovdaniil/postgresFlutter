// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'project_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProjectUser _$ProjectUserFromJson(Map<String, dynamic> json) {
  return _ProjectUser.fromJson(json);
}

/// @nodoc
class _$ProjectUserTearOff {
  const _$ProjectUserTearOff();

  _ProjectUser call(
      {@JsonKey(name: 'user_id')
          required int id,
      @JsonKey(name: 'user_name')
          required String name,
      @JsonKey(name: 'user_last_name')
          required String lastName,
      @JsonKey(name: 'user_patronymic')
          required String patronymic,
      @JsonKey(name: 'user_email')
          required String email,
      @JsonKey(name: 'user_phone')
          required int phone,
      @JsonKey(name: 'user_photo')
          required String photo,
      @JsonKey(name: 'user_role', fromJson: ProjectUser.roleFromJson)
          required ProjectUserRoles role}) {
    return _ProjectUser(
      id: id,
      name: name,
      lastName: lastName,
      patronymic: patronymic,
      email: email,
      phone: phone,
      photo: photo,
      role: role,
    );
  }

  ProjectUser fromJson(Map<String, Object?> json) {
    return ProjectUser.fromJson(json);
  }
}

/// @nodoc
const $ProjectUser = _$ProjectUserTearOff();

/// @nodoc
mixin _$ProjectUser {
  @JsonKey(name: 'user_id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_last_name')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_patronymic')
  String get patronymic => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_phone')
  int get phone => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_photo')
  String get photo => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_role', fromJson: ProjectUser.roleFromJson)
  ProjectUserRoles get role => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProjectUserCopyWith<ProjectUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectUserCopyWith<$Res> {
  factory $ProjectUserCopyWith(
          ProjectUser value, $Res Function(ProjectUser) then) =
      _$ProjectUserCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'user_id')
          int id,
      @JsonKey(name: 'user_name')
          String name,
      @JsonKey(name: 'user_last_name')
          String lastName,
      @JsonKey(name: 'user_patronymic')
          String patronymic,
      @JsonKey(name: 'user_email')
          String email,
      @JsonKey(name: 'user_phone')
          int phone,
      @JsonKey(name: 'user_photo')
          String photo,
      @JsonKey(name: 'user_role', fromJson: ProjectUser.roleFromJson)
          ProjectUserRoles role});
}

/// @nodoc
class _$ProjectUserCopyWithImpl<$Res> implements $ProjectUserCopyWith<$Res> {
  _$ProjectUserCopyWithImpl(this._value, this._then);

  final ProjectUser _value;
  // ignore: unused_field
  final $Res Function(ProjectUser) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastName = freezed,
    Object? patronymic = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? photo = freezed,
    Object? role = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: patronymic == freezed
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ProjectUserRoles,
    ));
  }
}

/// @nodoc
abstract class _$ProjectUserCopyWith<$Res>
    implements $ProjectUserCopyWith<$Res> {
  factory _$ProjectUserCopyWith(
          _ProjectUser value, $Res Function(_ProjectUser) then) =
      __$ProjectUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'user_id')
          int id,
      @JsonKey(name: 'user_name')
          String name,
      @JsonKey(name: 'user_last_name')
          String lastName,
      @JsonKey(name: 'user_patronymic')
          String patronymic,
      @JsonKey(name: 'user_email')
          String email,
      @JsonKey(name: 'user_phone')
          int phone,
      @JsonKey(name: 'user_photo')
          String photo,
      @JsonKey(name: 'user_role', fromJson: ProjectUser.roleFromJson)
          ProjectUserRoles role});
}

/// @nodoc
class __$ProjectUserCopyWithImpl<$Res> extends _$ProjectUserCopyWithImpl<$Res>
    implements _$ProjectUserCopyWith<$Res> {
  __$ProjectUserCopyWithImpl(
      _ProjectUser _value, $Res Function(_ProjectUser) _then)
      : super(_value, (v) => _then(v as _ProjectUser));

  @override
  _ProjectUser get _value => super._value as _ProjectUser;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastName = freezed,
    Object? patronymic = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? photo = freezed,
    Object? role = freezed,
  }) {
    return _then(_ProjectUser(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      patronymic: patronymic == freezed
          ? _value.patronymic
          : patronymic // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as int,
      photo: photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as ProjectUserRoles,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProjectUser implements _ProjectUser {
  const _$_ProjectUser(
      {@JsonKey(name: 'user_id')
          required this.id,
      @JsonKey(name: 'user_name')
          required this.name,
      @JsonKey(name: 'user_last_name')
          required this.lastName,
      @JsonKey(name: 'user_patronymic')
          required this.patronymic,
      @JsonKey(name: 'user_email')
          required this.email,
      @JsonKey(name: 'user_phone')
          required this.phone,
      @JsonKey(name: 'user_photo')
          required this.photo,
      @JsonKey(name: 'user_role', fromJson: ProjectUser.roleFromJson)
          required this.role});

  factory _$_ProjectUser.fromJson(Map<String, dynamic> json) =>
      _$$_ProjectUserFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final int id;
  @override
  @JsonKey(name: 'user_name')
  final String name;
  @override
  @JsonKey(name: 'user_last_name')
  final String lastName;
  @override
  @JsonKey(name: 'user_patronymic')
  final String patronymic;
  @override
  @JsonKey(name: 'user_email')
  final String email;
  @override
  @JsonKey(name: 'user_phone')
  final int phone;
  @override
  @JsonKey(name: 'user_photo')
  final String photo;
  @override
  @JsonKey(name: 'user_role', fromJson: ProjectUser.roleFromJson)
  final ProjectUserRoles role;

  @override
  String toString() {
    return 'ProjectUser(id: $id, name: $name, lastName: $lastName, patronymic: $patronymic, email: $email, phone: $phone, photo: $photo, role: $role)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProjectUser &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.patronymic, patronymic) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            const DeepCollectionEquality().equals(other.role, role));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(patronymic),
      const DeepCollectionEquality().hash(email),
      const DeepCollectionEquality().hash(phone),
      const DeepCollectionEquality().hash(photo),
      const DeepCollectionEquality().hash(role));

  @JsonKey(ignore: true)
  @override
  _$ProjectUserCopyWith<_ProjectUser> get copyWith =>
      __$ProjectUserCopyWithImpl<_ProjectUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProjectUserToJson(this);
  }
}

abstract class _ProjectUser implements ProjectUser {
  const factory _ProjectUser(
      {@JsonKey(name: 'user_id')
          required int id,
      @JsonKey(name: 'user_name')
          required String name,
      @JsonKey(name: 'user_last_name')
          required String lastName,
      @JsonKey(name: 'user_patronymic')
          required String patronymic,
      @JsonKey(name: 'user_email')
          required String email,
      @JsonKey(name: 'user_phone')
          required int phone,
      @JsonKey(name: 'user_photo')
          required String photo,
      @JsonKey(name: 'user_role', fromJson: ProjectUser.roleFromJson)
          required ProjectUserRoles role}) = _$_ProjectUser;

  factory _ProjectUser.fromJson(Map<String, dynamic> json) =
      _$_ProjectUser.fromJson;

  @override
  @JsonKey(name: 'user_id')
  int get id;
  @override
  @JsonKey(name: 'user_name')
  String get name;
  @override
  @JsonKey(name: 'user_last_name')
  String get lastName;
  @override
  @JsonKey(name: 'user_patronymic')
  String get patronymic;
  @override
  @JsonKey(name: 'user_email')
  String get email;
  @override
  @JsonKey(name: 'user_phone')
  int get phone;
  @override
  @JsonKey(name: 'user_photo')
  String get photo;
  @override
  @JsonKey(name: 'user_role', fromJson: ProjectUser.roleFromJson)
  ProjectUserRoles get role;
  @override
  @JsonKey(ignore: true)
  _$ProjectUserCopyWith<_ProjectUser> get copyWith =>
      throw _privateConstructorUsedError;
}
