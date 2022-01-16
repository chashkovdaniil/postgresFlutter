import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/projects/domain/entities/project.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/projects/presentation/state/projects_state.dart';
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

  Future<void> project(String id) async {
    if (userState.user == null) {
      throw Exception('User not auth');
    }
    state = state.copyWith(
      currentProject: await _projectsRepository.project(id),
    );
  }

  Future<void> addParticipant(ProjectUser participant) async {
    if (state.currentProject == null) {
      return;
    }
    if (state.currentProject!.participants != null &&
        state.currentProject!.participants!
            .any((e) => e.id == participant.id)) {
      return;
    }
    final participants = state.currentProject!.participants;
    state = state.copyWith(
      currentProject: state.currentProject!.copyWith(
        participants: {
          if (participants != null) ...participants,
          participant,
        },
      ),
    );
    await _projectsRepository.addParticipants(
      state.currentProject!,
      participant,
    );
  }

  Future<void> removeParticipant(ProjectUser participant) async {
    if (state.currentProject == null) {
      return;
    }
    final participants = state.currentProject!.participants;
    participants?.removeWhere(
      (element) => element.id == participant.id,
    );
    await _projectsRepository.removeParticipants(
      state.currentProject!,
      participant,
    );
    state = state.copyWith(
      currentProject: state.currentProject!.copyWith(
        participants: {if (participants != null) ...participants},
      ),
    );
  }
}
