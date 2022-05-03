import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/entities/message.dart';

part 'messages_state.freezed.dart';
// part 'messages_state.g.dart';

@freezed
class MessagesState with _$MessagesState {
  const factory MessagesState({
    required List<Message> messages,
  }) = _MessagesState;
}
