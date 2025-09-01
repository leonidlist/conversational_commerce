import 'dart:async';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';
import '../../models/chat_message.dart';
import '../../models/product.dart';
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
      List<Product> products = [];
      bool assistantMessageCreated = false;

      await for (final update in _chatService.sendMessageStream(
        message: userMessage,
        threadId: state.threadId,
        resourceId: state.resourceId,
      )) {
        debugPrint(
          'Received update: ${update['type']} - ${update['content']?.toString().length ?? 'null'} chars',
        );

        if (update['type'] == 'text') {
          // Update text content in real-time
          final newContent = update['content'] as String;
          debugPrint('New chunk: "$newContent" (${newContent.length} chars)');

          // Break down large chunks for typing animation
          final wasCreated = await _processTextChunkWithTyping(
            newContent,
            assistantResponse,
            products,
            assistantMessageCreated,
          );

          // Update the accumulated response
          assistantResponse += newContent;

          // Mark assistant message as created after first chunk
          if (!assistantMessageCreated && wasCreated) {
            assistantMessageCreated = true;
          }

          debugPrint('Total response length: ${assistantResponse.length}');
        } else if (update['type'] == 'products') {
          // Add products when they arrive
          products.addAll(update['products'] as List<Product>);

          // Update the last message if it's the assistant message
          if (assistantMessageCreated) {
            final updatedMessages = [...state.messages];
            if (updatedMessages.isNotEmpty &&
                updatedMessages.last.isAssistant) {
              updatedMessages[updatedMessages.length - 1] = updatedMessages.last
                  .copyWith(content: assistantResponse, products: products);
              emit(state.copyWith(messages: updatedMessages));
            }
          }
        }
      }
    } catch (e) {
      emit(state.copyWith(error: 'Failed to get response from our AI agent'));
      debugPrint('Error sending message: $e');
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  Future<bool> _processTextChunkWithTyping(
    String newContent,
    String currentResponse,
    List<Product> products,
    bool messageCreated,
  ) async {
    const int chunkSize = 3; // Process 3 characters at a time for typing effect
    const int delayMs = 20; // Delay between character chunks

    String tempResponse = currentResponse;
    bool wasMessageCreated = messageCreated;

    for (int i = 0; i < newContent.length; i += chunkSize) {
      final chunk = newContent.substring(
        i,
        math.min(i + chunkSize, newContent.length),
      );
      tempResponse += chunk;

      if (!wasMessageCreated && tempResponse.isNotEmpty) {
        // Create the assistant message on first chunk
        final assistantMessage = ChatMessage.assistant(
          content: tempResponse,
          products: products,
        );
        addMessage(assistantMessage);
        wasMessageCreated = true;
        debugPrint('Created assistant message with typing');
      } else if (wasMessageCreated) {
        // Update the last message with typing effect
        final updatedMessages = [...state.messages];
        if (updatedMessages.isNotEmpty && updatedMessages.last.isAssistant) {
          updatedMessages[updatedMessages.length - 1] = updatedMessages.last
              .copyWith(content: tempResponse, products: products);
          emit(state.copyWith(messages: updatedMessages));
          debugPrint('Typing update: ${tempResponse.length} chars');
        }
      }

      // Small delay for typing animation
      if (i + chunkSize < newContent.length) {
        await Future.delayed(Duration(milliseconds: delayMs));
      }
    }

    return wasMessageCreated;
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
