// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int,
      name: json['name'] as String,
      lastName: json['last_name'] as String,
      patronymic: json['patronymic'] as String,
      email: json['email'] as String,
      phone: json['phone'] as int,
      photo: const FileConverter().fromJson(json['photo'] as String),
      permission: json['permission'] as String,
      password: json['password'] as String,
      birthdate: User.dateTimeFromJson(json['birthdate']),
      post: json['post'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.lastName,
      'patronymic': instance.patronymic,
      'email': instance.email,
      'phone': instance.phone,
      'photo': const FileConverter().toJson(instance.photo),
      'permission': instance.permission,
      'password': instance.password,
      'birthdate': instance.birthdate?.toIso8601String(),
      'post': instance.post,
    };
