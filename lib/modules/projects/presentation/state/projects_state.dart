import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';

part 'projects_state.freezed.dart';

@freezed
class ProjectsState with _$ProjectsState {
  const factory ProjectsState({
    Project? currentProject,
    List<Project>? projects,
  }) = _ProjectsState;
}
