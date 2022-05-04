import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:riverpod/riverpod.dart';

import 'presentation/state/messages_manager.dart';

class MessagesProviders {
  static AutoDisposeProvider<MessagesManager> messagesManagerProvider =
      Provider.autoDispose<MessagesManager>(
    (ref) {
      final manager = MessagesManager(
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
