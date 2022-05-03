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

class MessagesPageList extends ConsumerWidget {
  const MessagesPageList({Key? key}) : super(key: key);

  @override
  Widget build(context, ref) {
    final messages = ref
        .watch(MessagesProviders.messageStateProvider.select((s) => s.messages))
        .reversed
        .toList();

    final user = ref.watch(UserProvider.userState).user;

    if (user == null) {
      return const CircularProgressIndicator();
    }

    if (messages.isEmpty) {
      return const Expanded(
        child: Center(
          child: Text('Empty'),
        ),
      );
    }
    return ListView.builder(
      reverse: true,
      itemCount: messages.length,
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
                hintText: 'Type message...',
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
