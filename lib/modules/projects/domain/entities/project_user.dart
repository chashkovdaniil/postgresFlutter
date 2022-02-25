import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/core/converters/file_converter.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

part 'project_user.freezed.dart';
part 'project_user.g.dart';

enum ProjectUserRoles { user, admin }

@freezed
class ProjectUser with _$ProjectUser {
  const ProjectUser._();
  const factory ProjectUser({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'last_name') required String lastName,
    @JsonKey(name: 'patronymic') required String patronymic,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'phone') required int phone,
    @FileConverter() required File photo,
    @JsonKey(name: 'role', fromJson: ProjectUser.roleFromJson)
        required ProjectUserRoles role,
  }) = _ProjectUser;
  String get fullname => '$lastName $name $patronymic';

  factory ProjectUser.fromUser(User user, ProjectUserRoles role) {
    return ProjectUser(
      id: user.id,
      name: user.name,
      lastName: user.lastName,
      patronymic: user.patronymic,
      email: user.email,
      phone: user.phone,
      photo: user.photo,
      role: role,
    );
  }
  factory ProjectUser.fromJson(Map<String, dynamic> json) =>
      _$ProjectUserFromJson(json);

  static ProjectUserRoles roleFromJson(dynamic val) {
    switch (val as String) {
      case 'admin':
        return ProjectUserRoles.admin;
      case 'user':
        return ProjectUserRoles.user;
      default:
        return ProjectUserRoles.user;
    }
  }

  @override
  bool operator ==(dynamic nex) {
    return email == (nex as ProjectUser).email;
  }
}
