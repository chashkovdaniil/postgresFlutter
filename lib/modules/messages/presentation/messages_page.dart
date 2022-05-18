import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:postgresUn/core/providers/projects_provider.dart';
import 'package:postgresUn/core/providers/user_provider.dart';
import 'package:postgresUn/modules/messages/data/entities/message.dart';
import 'package:postgresUn/modules/messages/messages_providers.dart';
import 'package:postgresUn/modules/users/domain/entities/user.dart';

import 'message_widget.dart';

class MessagesPage extends HookConsumerWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    return Column(
      children: const [
        Expanded(
          child: MessagesPageList(),
        ),
        MessageTypeMessage(),
      ],
    );
  }
}

class MessagesPageList extends HookConsumerWidget {
  const MessagesPageList({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final user = ref.watch(UserProvider.userState).user;

    if (user == null) {
      return const CircularProgressIndicator();
    }
    final messagesManager =
        ref.watch(MessagesProviders.messagesManagerProvider);

    useEffect(
      () {
        messagesManager.onInit();
        return null;
      },
      const [],
    );

    final messages = ref
        .watch(
          ProjectsProvider.projectStateProvider.select((s) => s.messages),
        )
        ?.reversed
        .toList();

    if (messages == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (messages.isEmpty) {
      return const Center(
        child: Text('Chat empty'),
      );
    }

    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
      dragStartBehavior: DragStartBehavior.down,
      itemBuilder: (context, index) {
        return Align(
          alignment: messages[index].user.id == 0
              ? Alignment.center
              : messages[index].user.id == user.id
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
          child: MessageWidget(
            user: user,
            nextMessage: index == 0 ? null : messages[index - 1],
            message: messages[index],
            prevMessage:
                index == messages.length - 1 ? null : messages[index + 1],
          ),
        );
      },
    );
  }
}

class MessageTypeMessage extends HookConsumerWidget {
  const MessageTypeMessage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(context, ref) {
    final messagesManager = ref.read(MessagesProviders.messagesManagerProvider);

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
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Введите сообщение...',
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            messagesManager.sendMessage(messageController.text);
            messageController.clear();
          },
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}
