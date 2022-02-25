import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/messages/data/entities/message.dart';
import 'package:postgresUn/modules/projects/domain/entities/project_user.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

class Messages extends HookConsumerWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final user = ref.watch(UserProvider.userState).user;
    final messages = ref
        .watch(ProjectsProvider.projectsState)
        .currentProject!
        .messages!
        .reversed
        .toList();
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messages.length,
            itemBuilder: (context, index) {
              return Align(
                alignment: messages[index].user.id == 0
                    ? Alignment.center
                    : messages[index].user.id == user!.id
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                child: MessageWidget(
                  user: user!,
                  nextMessage: index == 0 ? null : messages[index - 1],
                  message: messages[index],
                  prevMessage:
                      index == messages.length - 1 ? null : messages[index + 1],
                ),
              );
            },
          ),
        ),
        const MessageTypeMessage(),
      ],
    );
  }
}

class MessageTypeMessage extends HookConsumerWidget {
  const MessageTypeMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final projectsManager = ref.watch(ProjectsProvider.projectsManager);
    final project = ref.watch(ProjectsProvider.projectsState).currentProject!;
    final user = ref.watch(UserProvider.userState).user!;
    final projectUser = project.users!.firstWhere(
      (u) => u.id == user.id,
    );
    final messageController = useTextEditingController();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 70,
              maxHeight: 300,
            ),
            child: TextFormField(
              controller: messageController,
              expands: false,
              minLines: null,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Type message...',
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            projectsManager.sendMessage(
              Message(
                text: messageController.text,
                user: projectUser,
                timestamp: DateTime.now(),
              ),
            );
            messageController.clear();
          },
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}

class MessageWidget extends StatelessWidget {
  final User user;
  final Message? prevMessage;
  final Message message;
  final Message? nextMessage;
  const MessageWidget({
    Key? key,
    required this.user,
    required this.message,
    this.prevMessage,
    this.nextMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isUser = user.id == message.user.id;
    final isNotSystem = message.user.id != 0;
    final haveUserNextMessage =
        nextMessage == null || nextMessage!.user.id != message.user.id;
    final haveUserPrevMessage = prevMessage?.user.id != message.user.id;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        5,
        haveUserPrevMessage ? 10 : 0,
        5,
        haveUserPrevMessage ? 10 : 0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isNotSystem && !isUser && haveUserNextMessage)
            CircleAvatar(
              foregroundImage: Image.file(
                message.user.photo,
                filterQuality: FilterQuality.high,
                fit: BoxFit.fill,
              ).image,
              child: const Icon(Icons.photo),
            )
          else
            const SizedBox(
              width: 40,
              height: 40,
            ),
          const SizedBox(width: 10),
          Container(
            margin: EdgeInsets.fromLTRB(
              5,
              haveUserPrevMessage ? 20 : 5,
              5,
              0,
            ),
            padding: const EdgeInsets.fromLTRB(25, 15, 25, 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).primaryColor.withOpacity(
                    isUser ? 0.5 : 0.1,
                  ),
            ),
            child: Column(
              crossAxisAlignment: !isNotSystem
                  ? CrossAxisAlignment.center
                  : isUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!isUser && isNotSystem && haveUserPrevMessage)
                  Text(
                    message.user.fullname,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                if (!isUser && isNotSystem && haveUserPrevMessage)
                  const SizedBox(height: 10),
                Text(
                  message.text,
                  textAlign: !isNotSystem
                      ? TextAlign.center
                      : isUser
                          ? TextAlign.end
                          : TextAlign.start,
                ),
                const SizedBox(height: 10),
                Text(
                  '${message.timestamp.year}.${message.timestamp.month}'
                  '${message.timestamp.day} ${message.timestamp.hour}:'
                  '${message.timestamp.minute}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
