import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../../models/chat_message.dart';
import '../../services/chat_service.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit({ChatService? chatService})
    : _chatService = chatService ?? ChatService(),
      super(
        ChatState.initial(
          threadId: const Uuid().v4(),
          resourceId: const Uuid().v4(),
        ),
      );

  final ChatService _chatService;
  StreamSubscription? _streamSubscription;

  void addMessage(ChatMessage message) {
    final updatedMessages = [...state.messages, message];
    emit(state.copyWith(messages: updatedMessages));
  }

  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    emit(state.copyWith(error: null));

    final userMessage = ChatMessage.user(content: content.trim());
    addMessage(userMessage);
    emit(state.copyWith(isLoading: true));

    try {
      String assistantResponse = '';

      await for (final chunk in _chatService.sendMessageStream(
        message: userMessage,
        threadId: state.threadId,
        resourceId: state.resourceId,
      )) {
        assistantResponse += chunk;

        if (assistantResponse.trim().isNotEmpty) {
          break;
        }
      }

      if (assistantResponse.trim().isNotEmpty) {
        final assistantMessage = ChatMessage.assistant(
          content: assistantResponse.trim(),
        );
        addMessage(assistantMessage);
      }
    } catch (e) {
      emit(state.copyWith(error: 'Failed to get response from our AI agent'));
      debugPrint('Error sending message: $e');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
