// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required int id,
      required String name,
      @JsonKey(name: 'last_name') required String lastName,
      required String patronymic,
      required String email,
      required int phone,
      required String photo,
      required String permission,
      required String password,
      @JsonKey(fromJson: User.dateTimeFromJson) DateTime? birthdate}) {
    return _User(
      id: id,
      name: name,
      lastName: lastName,
      patronymic: patronymic,
      email: email,
      phone: phone,
      photo: photo,
      permission: permission,
      password: password,
      birthdate: birthdate,
    );
  }

  User fromJson(Map<String, Object?> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String get lastName => throw _privateConstructorUsedError;
  String get patronymic => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  int get phone => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;
  String get permission => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  @JsonKey(fromJson: User.dateTimeFromJson)
  DateTime? get birthdate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'last_name') String lastName,
      String patronymic,
      String email,
      int phone,
      String photo,
      String permission,
      String password,
      @JsonKey(fromJson: User.dateTimeFromJson) DateTime? birthdate});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastName = freezed,
    Object? patronymic = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? photo = freezed,
    Object? permission = freezed,
    Object? password = freezed,
    Object? birthdate = freezed,
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
      permission: permission == freezed
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: birthdate == freezed
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {int id,
      String name,
      @JsonKey(name: 'last_name') String lastName,
      String patronymic,
      String email,
      int phone,
      String photo,
      String permission,
      String password,
      @JsonKey(fromJson: User.dateTimeFromJson) DateTime? birthdate});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? lastName = freezed,
    Object? patronymic = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? photo = freezed,
    Object? permission = freezed,
    Object? password = freezed,
    Object? birthdate = freezed,
  }) {
    return _then(_User(
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
      permission: permission == freezed
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as String,
      password: password == freezed
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      birthdate: birthdate == freezed
          ? _value.birthdate
          : birthdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.id,
      required this.name,
      @JsonKey(name: 'last_name') required this.lastName,
      required this.patronymic,
      required this.email,
      required this.phone,
      required this.photo,
      required this.permission,
      required this.password,
      @JsonKey(fromJson: User.dateTimeFromJson) this.birthdate});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'last_name')
  final String lastName;
  @override
  final String patronymic;
  @override
  final String email;
  @override
  final int phone;
  @override
  final String photo;
  @override
  final String permission;
  @override
  final String password;
  @override
  @JsonKey(fromJson: User.dateTimeFromJson)
  final DateTime? birthdate;

  @override
  String toString() {
    return 'User(id: $id, name: $name, lastName: $lastName, patronymic: $patronymic, email: $email, phone: $phone, photo: $photo, permission: $permission, password: $password, birthdate: $birthdate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _User &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.patronymic, patronymic) &&
            const DeepCollectionEquality().equals(other.email, email) &&
            const DeepCollectionEquality().equals(other.phone, phone) &&
            const DeepCollectionEquality().equals(other.photo, photo) &&
            const DeepCollectionEquality()
                .equals(other.permission, permission) &&
            const DeepCollectionEquality().equals(other.password, password) &&
            const DeepCollectionEquality().equals(other.birthdate, birthdate));
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
      const DeepCollectionEquality().hash(permission),
      const DeepCollectionEquality().hash(password),
      const DeepCollectionEquality().hash(birthdate));

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {required int id,
      required String name,
      @JsonKey(name: 'last_name') required String lastName,
      required String patronymic,
      required String email,
      required int phone,
      required String photo,
      required String permission,
      required String password,
      @JsonKey(fromJson: User.dateTimeFromJson) DateTime? birthdate}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'last_name')
  String get lastName;
  @override
  String get patronymic;
  @override
  String get email;
  @override
  int get phone;
  @override
  String get photo;
  @override
  String get permission;
  @override
  String get password;
  @override
  @JsonKey(fromJson: User.dateTimeFromJson)
  DateTime? get birthdate;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
