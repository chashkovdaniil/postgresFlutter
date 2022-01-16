// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectUser _$$_ProjectUserFromJson(Map<String, dynamic> json) =>
    _$_ProjectUser(
      id: json['user_id'] as int,
      name: json['user_name'] as String,
      lastName: json['user_last_name'] as String,
      patronymic: json['user_patronymic'] as String,
      email: json['user_email'] as String,
      phone: json['user_phone'] as int,
      photo: json['user_photo'] as String,
      role: ProjectUser.roleFromJson(json['user_role']),
    );

Map<String, dynamic> _$$_ProjectUserToJson(_$_ProjectUser instance) =>
    <String, dynamic>{
      'user_id': instance.id,
      'user_name': instance.name,
      'user_last_name': instance.lastName,
      'user_patronymic': instance.patronymic,
      'user_email': instance.email,
      'user_phone': instance.phone,
      'user_photo': instance.photo,
      'user_role': _$ProjectUserRolesEnumMap[instance.role],
    };

const _$ProjectUserRolesEnumMap = {
  ProjectUserRoles.user: 'user',
  ProjectUserRoles.admin: 'admin',
};
