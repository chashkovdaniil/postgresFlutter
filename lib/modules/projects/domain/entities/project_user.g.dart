// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProjectUser _$$_ProjectUserFromJson(Map<String, dynamic> json) =>
    _$_ProjectUser(
      id: json['id'] as int,
      name: json['name'] as String,
      lastName: json['last_name'] as String,
      patronymic: json['patronymic'] as String,
      email: json['email'] as String,
      phone: json['phone'] as int,
      photo: const FileConverter().fromJson(json['photo'] as String),
      role: ProjectUser.roleFromJson(json['role']),
      post: json['post'] as String?,
    );

Map<String, dynamic> _$$_ProjectUserToJson(_$_ProjectUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'last_name': instance.lastName,
      'patronymic': instance.patronymic,
      'email': instance.email,
      'phone': instance.phone,
      'photo': const FileConverter().toJson(instance.photo),
      'role': _$ProjectUserRolesEnumMap[instance.role],
      'post': instance.post,
    };

const _$ProjectUserRolesEnumMap = {
  ProjectUserRoles.user: 'user',
  ProjectUserRoles.admin: 'admin',
};
