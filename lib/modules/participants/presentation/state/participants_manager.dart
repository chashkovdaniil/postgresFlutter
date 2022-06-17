import 'dart:async';

import 'package:postgresUn/core/exceptions.dart';
// import 'package:postgresUn/modules/participants/presentation/state/participants_state_holder.dart';
import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/projects/presentation/state/project_manager.dart';
import 'package:postgresUn/modules/users/presentation/state/user_state.dart';

import '../../../projects/domain/entities/project.dart';

// import '../../data/entities/message.dart';

class ParticipantsManager {
  StreamSubscription? _participantsStream;
  // final ParticipantsStateHolder participantsStateHolder;
  final ProjectsRepository projectsRepository;
  final ProjectManager projectManager;
  final ProjectStateHolder projectStateHolder;
  final UserState userState;
  ParticipantsManager({
    // required this.participantsStateHolder,
    required this.projectsRepository,
    required this.projectStateHolder,
    required this.projectManager,
    required this.userState,
  });

  Future<void> onInit() async {
    final stream = Stream.periodic(const Duration(milliseconds: 1000));
    _participantsStream ??= stream.listen((event) async {
      await loadParticipants();
    });
  }

  onDispose() => _participantsStream?.cancel();

  Future<void> loadParticipants() async {
    final project = projectStateHolder.currentProject;

    if (project != null) {
      final participants = await projectsRepository.participants(project);
      participants.removeWhere((element) => element.id == 0);
      setParticipants(participants);
    }
  }

  void setParticipants(List<ProjectUser> participants) =>
      projectManager.setParticipants(participants);

  Future<void> addParticipant(Project project, ProjectUser projectUser) async {
    if (projectStateHolder.state.participants?.any(
          (element) => element.id == projectUser.id,
        ) ==
        true) {
      return;
    }
    return projectsRepository.addParticipant(project, projectUser);
  }

  Future<void> removeParticipant(Project project, ProjectUser user) =>
      projectsRepository.removeParticipant(project, user);
}
