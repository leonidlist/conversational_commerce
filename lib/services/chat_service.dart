import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/chat_message.dart';

const String _baseUrl =
    'https://convai-agents-staging.on.com/api/agents/copilotAgent/stream';

class ChatService {
  ChatService() {
    _dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Convai-Api-Key': dotenv.env['API_KEY'] ?? '',
        },
      ),
    );

    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  late final Dio _dio;

  Stream<String> sendMessageStream({
    required ChatMessage message,
    required String threadId,
    required String resourceId,
  }) async* {
    try {
      final response = await _dio.post<ResponseBody>(
        _baseUrl,
        data: {
          'messages': [message.toApiJson()],
          'threadId': threadId,
          'resourceId': resourceId,
        },
        options: Options(responseType: ResponseType.stream),
      );

      if (response.statusCode == 200 && response.data != null) {
        final stream = response.data!.stream;
        await for (final bytes in stream) {
          final chunk = utf8.decode(bytes);
          if (chunk.trim().isNotEmpty) {
            yield chunk.trim();
          }
        }
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Failed to send message: ${response.statusCode}',
        );
      }
    } on DioException catch (e) {
      throw Exception('Network error: ${e.message}');
    } catch (e) {
      throw Exception('Error sending message: $e');
    }
  }
}
