import 'package:flutter/material.dart';

import '../../users/domain/entities/user.dart';
import '../data/entities/message.dart';

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
                  '${message.timestamp.year}.${message.timestamp.month}.'
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
