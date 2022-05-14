import 'dart:async';

import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/tasks/presentation/state/tasks_manager.dart';
import 'package:postgresUn/modules/users/presentation/state/user_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/exceptions.dart';
import '../../../messages/data/entities/message.dart';
import '../../../tasks/domain/task.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/project_user.dart';
import 'project_state.dart';

class ProjectManager {
  final Stream projectStream;
  final ProjectStateHolder stateHolder;
  final ProjectsRepository projectsRepository;
  final UserState userState;
  StreamSubscription? projectSubscription;

  ProjectManager({
    required this.stateHolder,
    required this.projectsRepository,
    required this.userState,
  }) : projectStream =
            Stream.periodic(const Duration(milliseconds: 1000), (_) {});

  void onDispose() => projectSubscription?.cancel();

  Future<void> onInit(int projectId) async {
    if (userState.user == null) throw UserNotAuthExceptions();

    final project = await projectsRepository.project(projectId);
    final users = project.users;
    var isAllowedAdmin = false;

    if (users != null) {
      isAllowedAdmin = users.any(
        (user) =>
            user.role == ProjectUserRoles.admin &&
            user.id == userState.user!.id,
      );
    }
    stateHolder.setProject(project, isAllowedAdmin);
  }

  void selectTasksSort(TasksSort tasksSort) =>
      stateHolder.setTasksSort(tasksSort);
  void setTasks(List<Task> tasks) => stateHolder.setTasks(tasks);
  void setMessages(List<Message> messages) => stateHolder.setMessages(messages);
  void setParticipants(List<ProjectUser> participants) =>
      stateHolder.setParticipants(participants);
}

class ProjectStateHolder extends StateNotifier<ProjectState> {
  ProjectStateHolder() : super(const ProjectState());

  void setProject(Project project, [bool isAllowedAdmin = false]) {
    state = state.copyWith(
      isAllowedAdmin: isAllowedAdmin,
      currentProject: project,
    );
  }

  void setTasks(List<Task>? tasks) {
    state = state.copyWith(
      tasks: tasks,
    );
  }

  void setMessages(List<Message>? messages) {
    state = state.copyWith(
      messages: messages,
    );
  }

  void setParticipants(List<ProjectUser> participants) {
    state = state.copyWith(
      participants: participants,
    );
  }

  void setTasksSort(TasksSort tasksSort) {
    state = state.copyWith(
      tasksSort: tasksSort,
    );
  }

  Project? get currentProject => state.currentProject;
}
