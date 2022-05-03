import 'dart:async';

import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/users/presentation/state/user_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../../../core/exceptions.dart';
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

  void onDispose() {
    print('onDispose');
    projectSubscription?.cancel();
  }

  Future<void> onInit(int projectId) async {
    if (userState.user == null) throw UserNotAuthExceptions();

    if (projectSubscription != null) return;
    projectSubscription = projectStream.listen((_) async {
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
    });
  }

  Future<void> addTaskToProject(Task task) async {
    final project = stateHolder.currentProject;
    if (project == null) {
      throw ProjectNullException();
    }
    await projectsRepository.addTask(project, task);
  }
}

class ProjectStateHolder extends StateNotifier<ProjectState> {
  ProjectStateHolder() : super(const ProjectState());

  setProject(Project project, [bool isAllowedAdmin = false]) {
    state = state.copyWith(
      isAllowedAdmin: isAllowedAdmin,
      currentProject: project,
    );
  }

  Project? get currentProject => state.currentProject;
}
