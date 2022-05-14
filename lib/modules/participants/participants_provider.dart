import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:postgresUn/modules/participants/presentation/state/participants_manager.dart';

import '../../core/providers/projects_provider.dart';
import '../../core/providers/user_provider.dart';

class ParticipantProvider {
  static AutoDisposeProvider<ParticipantsManager> participantsManagerProvider =
      Provider.autoDispose<ParticipantsManager>(
    (ref) {
      final manager = ParticipantsManager(
        // messagesStateHolder: ref.watch(messageStateProvider.notifier),
        projectsRepository: ref.watch(ProjectsProvider.projectsRepository),
        projectStateHolder: ref.watch(
          ProjectsProvider.projectStateProvider.notifier,
        ),
        userState: ref.watch(UserProvider.userState),
        projectManager: ref.watch(ProjectsProvider.projectManagerProvider),
      );

      ref.onDispose(manager.onDispose);

      return manager;
    },
  );
}
