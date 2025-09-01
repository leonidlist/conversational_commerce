import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/chat_message.dart';

part 'chat_state.freezed.dart';

@freezed
class ChatState with _$ChatState {
  const factory ChatState({
    @Default([]) List<ChatMessage> messages,
    @Default(false) bool isLoading,
    String? error,
    required String threadId,
    required String resourceId,
  }) = _ChatState;

  factory ChatState.initial({
    required String threadId,
    required String resourceId,
  }) => ChatState(threadId: threadId, resourceId: resourceId);
}
