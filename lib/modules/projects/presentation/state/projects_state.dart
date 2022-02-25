import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

part 'projects_state.freezed.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState({
    @Default(false) bool isAllowedAdmin,
    Project? currentProject,
    List<Project>? projects,
  }) = _ProjectsState;
}
