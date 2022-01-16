import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

part 'project_user.freezed.dart';
part 'project_user.g.dart';

enum ProjectUserRoles { user, admin }

@freezed
class ProjectUser with _$ProjectUser {
  const factory ProjectUser({
    @JsonKey(name: 'user_id') required int id,
    @JsonKey(name: 'user_name') required String name,
    @JsonKey(name: 'user_last_name') required String lastName,
    @JsonKey(name: 'user_patronymic') required String patronymic,
    @JsonKey(name: 'user_email') required String email,
    @JsonKey(name: 'user_phone') required int phone,
    @JsonKey(name: 'user_photo') required String photo,
    @JsonKey(name: 'user_role', fromJson: ProjectUser.roleFromJson)
        required ProjectUserRoles role,
  }) = _ProjectUser;

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
}
