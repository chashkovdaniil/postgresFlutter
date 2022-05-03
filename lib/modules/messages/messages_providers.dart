import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/messages/presentation/state/messages_state_holder.dart';
import 'package:riverpod/riverpod.dart';

import 'presentation/state/messages_manager.dart';
import 'presentation/state/messages_state.dart';

class MessagesProviders {
  static AutoDisposeProvider<MessagesManager> messagesManagerProvider =
      Provider.autoDispose<MessagesManager>(
    (ref) => MessagesManager(
      messagesStateHolder: ref.watch(messageStateProvider.notifier),
      projectsRepository: ref.watch(ProjectsProvider.projectsRepository),
      projectStateHolder: ref.watch(
        ProjectsProvider.projectStateProvider.notifier,
      ),
      userState: ref.watch(UserProvider.userState),
    ),
  );

  static AutoDisposeStateNotifierProvider<MessagesStateHolder, MessagesState>
      messageStateProvider =
      StateNotifierProvider.autoDispose<MessagesStateHolder, MessagesState>(
    (ref) => MessagesStateHolder(
      MessagesState(
        messages: ref.watch(
          ProjectsProvider.projectStateProvider.select(
            (s) => s.currentProject?.messages ?? [],
          ),
        ),
      ),
    ),
  );
}
