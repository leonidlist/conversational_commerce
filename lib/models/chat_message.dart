import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

enum MessageRole {
  @JsonValue('user')
  user,
  @JsonValue('assistant')
  assistant,
}

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String content,
    required MessageRole role,
    required DateTime timestamp,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  factory ChatMessage.user({required String content}) => ChatMessage(
    content: content,
    role: MessageRole.user,
    timestamp: DateTime.now(),
  );

  factory ChatMessage.assistant({required String content}) => ChatMessage(
    content: content,
    role: MessageRole.assistant,
    timestamp: DateTime.now(),
  );
}

extension ChatMessageX on ChatMessage {
  bool get isUser => role == MessageRole.user;
  bool get isAssistant => role == MessageRole.assistant;

  Map<String, dynamic> toApiJson() {
    return {
      'role': role == MessageRole.user ? 'user' : 'assistant',
      'content': content,
    };
  }
}
