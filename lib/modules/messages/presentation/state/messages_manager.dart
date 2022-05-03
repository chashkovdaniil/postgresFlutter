import 'package:postgresUn/core/exceptions.dart';
import 'package:postgresUn/modules/messages/presentation/state/messages_state_holder.dart';
import 'package:postgresUn/modules/projects/data/projects_repository.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/projects/presentation/state/project_manager.dart';
import 'package:postgresUn/modules/users/presentation/state/user_state.dart';

import '../../data/entities/message.dart';

class MessagesManager {
  final MessagesStateHolder messagesStateHolder;
  final ProjectsRepository projectsRepository;
  final ProjectStateHolder projectStateHolder;
  final UserState userState;
  MessagesManager({
    required this.messagesStateHolder,
    required this.projectsRepository,
    required this.projectStateHolder,
    required this.userState,
  });

  void setMessages(List<Message>? messages) {
    messagesStateHolder.setMessages(messages ?? []);
  }

  Future<void> sendMessage(String text) async {
    final project = projectStateHolder.currentProject;
    final user = userState.user;
    final users = project?.users;
    if (project == null) throw ProjectNullException();
    if (user == null) throw UserNotAuthExceptions();
    if (users == null) throw ProjectNullException();
    final projectUser = users.firstWhere(
      (e) => e.id == user.id,
    );
    final message = Message(
      text: text,
      user: projectUser,
      timestamp: DateTime.now(),
    );

    await projectsRepository.sendMessage(project, message);
  }
}
