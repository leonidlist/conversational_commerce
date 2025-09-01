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
        StringBuffer buffer = StringBuffer();

        await for (final bytes in stream) {
          final chunk = utf8.decode(bytes);
          buffer.write(chunk);

          // Process complete lines
          String content = buffer.toString();
          List<String> lines = content.split('\n');

          // Keep the last potentially incomplete line in buffer
          buffer.clear();
          if (lines.isNotEmpty && !content.endsWith('\n')) {
            buffer.write(lines.removeLast());
          }

          // Process complete lines
          for (final line in lines) {
            if (line.trim().isNotEmpty) {
              final textContent = _parseStreamLine(line.trim());
              if (textContent != null) {
                yield textContent;
              }
            }
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

  String? _parseStreamLine(String line) {
    try {
      // Check if line starts with "0:" (text content)
      if (line.startsWith('0:')) {
        final jsonPart = line.substring(2); // Remove "0:" prefix
        final decodedJson = jsonDecode(jsonPart);
        if (decodedJson is String) {
          return decodedJson;
        }
      }
      // Ignore other line types (f:, 9:, a:, e:, d:)
      return null;
    } catch (e) {
      // If parsing fails, ignore this line
      return null;
    }
  }
}
