import 'package:postgresUn/modules/messages/presentation/state/messages_state.dart';
import 'package:riverpod/riverpod.dart';

import '../../data/entities/message.dart';

class MessagesStateHolder extends StateNotifier<MessagesState> {
  MessagesStateHolder([MessagesState? state])
      : super(state ?? const MessagesState(messages: []));

  void setMessages(List<Message> messages) {
    state = state.copyWith(
      messages: messages,
    );
  }
}
