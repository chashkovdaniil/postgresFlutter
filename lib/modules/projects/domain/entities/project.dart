import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/modules/messages/data/entities/message.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/tasks/domain/task.dart';

part 'project.freezed.dart';
part 'project.g.dart';

@freezed
class Project with _$Project {
  const factory Project({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'count_tasks') required int countTasks,
    @JsonKey(name: 'count_done_tasks') required int countDoneTasks,
    @JsonKey(name: 'tasks') List<Task>? tasks,
    // @JsonKey(name: 'messages') List<Message>? messages,
    @JsonKey(name: 'users') Set<ProjectUser>? users,
    @JsonKey(name: 'admins') Set<ProjectUser>? admins,
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
    required Set<ProjectUser> users,
    required Set<ProjectUser> admins,
  }) = _StartProject;

  factory StartProject.fromJson(Map<String, dynamic> json) =>
      _$StartProjectFromJson(json);
}
