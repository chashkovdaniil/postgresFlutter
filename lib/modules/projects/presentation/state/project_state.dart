import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:postgresUn/modules/tasks/presentation/state/tasks_manager.dart';

import '../../../messages/data/entities/message.dart';
import '../../../tasks/domain/task.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/project_user.dart';

part 'project_state.freezed.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState({
    @Default(false) bool isAllowedAdmin,
    Project? currentProject,
    List<Task>? tasks,
    @Default(TasksSort.date) TasksSort tasksSort,
    @Default(TasksSortByAplha.asc) TasksSortByAplha tasksSortByAlpha,
    List<Message>? messages,
    List<ProjectUser>? participants,
  }) = _ProjectState;
}
