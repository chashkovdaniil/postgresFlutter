import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    @JsonKey(name: 'project_id') required int id,
    @JsonKey(name: 'project_title') required String title,
    @JsonKey(name: 'project_count_tasks') required int countTasks,
    @JsonKey(name: 'project_count_done_tasks') required int countDoneTasks,
    @JsonKey(name: 'project_participants') Set<ProjectUser>? participants,
    @JsonKey(name: 'project_creator') ProjectUser? creator,
  }) = _Project;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@freezed
class StartProject with _$StartProject {
  const factory StartProject({
    required String title,
    int? countTasks,
    int? countDoneTasks,
    required Set<ProjectUser> participants,
    required ProjectUser creator,
  }) = _StartProject;

  factory StartProject.fromJson(Map<String, dynamic> json) =>
      _$StartProjectFromJson(json);
}
