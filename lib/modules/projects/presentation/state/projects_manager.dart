import 'package:postgresUn/modules/messages/data/entities/message.dart';
import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/projects/presentation/state/projects_state.dart';
import 'package:postgresUn/modules/tasks/domain/task.dart';
import 'package:postgresUn/modules/users/presentation/state/user_state.dart';
import 'package:riverpod/riverpod.dart';

class ProjectsManager extends StateNotifier<ProjectsState> {
  final UserState userState;
  final ProjectsRepository _projectsRepository;
  ProjectsManager({
    required this.userState,
    required ProjectsRepository projectsRepository,
  })  : _projectsRepository = projectsRepository,
        super(const ProjectsState());

  Future<void> projects() async {
    if (userState.user == null) {
      throw Exception('User not auth');
    }
    state = state.copyWith(
      projects: await _projectsRepository.projects(userState.user!),
    );
  }

  Future<void> create(StartProject startProject) async {
    final project = await _projectsRepository.create(startProject);
    state = state.copyWith(
      projects: (state.projects == null) ? [project] : state.projects
        ?..add(project),
    );
  }

  Future<void> delete(Project project) async {
    await _projectsRepository.delete(project);
    final projects = state.projects
      ?..removeWhere(
        (el) => el.id == project.id,
      );
    state = state.copyWith(
      projects: projects,
    );
  }

  // Future<void> selectProject(int id) async {
  //   if (userState.user == null) {
  //     throw Exception('User not auth');
  //   }
  //   final updatedProject = await _projectsRepository.project(id);

  //   if (updatedProject == state.currentProject) {
  //     return;
  //   }
  //   var isAllowedAdmin = false;
  //   if (updatedProject.users != null) {
  //     isAllowedAdmin = updatedProject.users!.any((element) {
  //       return element.role == ProjectUserRoles.admin &&
  //           element.id == userState.user!.id;
  //     });
  //   }
  //   state = state.copyWith(
  //     currentProject: updatedProject,
  //     isAllowedAdmin: isAllowedAdmin,
  //   );
  // }

  // Future<void> addParticipant(ProjectUser participant) async {
  //   if (state.currentProject == null) {
  //     return;
  //   }
  //   if (state.currentProject!.users != null &&
  //       state.currentProject!.users!.any((e) => e.id == participant.id)) {
  //     return;
  //   }
  //   final users = state.currentProject!.users;
  //   state = state.copyWith(
  //     currentProject: state.currentProject!.copyWith(
  //       users: {
  //         if (users != null) ...users,
  //         participant,
  //       },
  //     ),
  //   );
  //   await _projectsRepository.addParticipants(
  //     state.currentProject!,
  //     participant,
  //   );
  // }

  // Future<void> removeParticipant(ProjectUser participant) async {
  //   if (state.currentProject == null) {
  //     return;
  //   }
  //   final users = state.currentProject!.users;
  //   users?.removeWhere(
  //     (element) => element.id == participant.id,
  //   );
  //   await _projectsRepository.removeParticipants(
  //     state.currentProject!,
  //     participant,
  //   );
  //   state = state.copyWith(
  //     currentProject: state.currentProject!.copyWith(
  //       users: {if (users != null) ...users},
  //     ),
  //   );
  // }

  // Future<void> sendMessage(Message message) async {
  //   final project = state.currentProject!;
  //   final result = await _projectsRepository.sendMessage(project, message);
  //   state = state.copyWith(
  //     currentProject: project.copyWith(
  //       messages: project.messages!..add(result),
  //     ),
  //   );
  // }

  // Project? get currentProject => state.currentProject;
}
