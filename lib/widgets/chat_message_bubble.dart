import 'package:flutter/material.dart';
import 'package:markdown_widget/markdown_widget.dart';
import '../models/chat_message.dart';
import 'product_card.dart';

class ChatMessageBubble extends StatelessWidget {
  final ChatMessage message;

  const ChatMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isUser = message.isUser;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: isUser ? 16 : 0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: isUser ? Color(0xFF111111) : null,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child:
                        message.isUser
                            ? Text(
                              message.content,
                              style: const TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            )
                            : _MarkdownMessageContent(content: message.content),
                  ),
                  const SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _formatTime(message.timestamp),
                      style: TextStyle(color: Color(0x88FFFFFF), fontSize: 12),
                    ),
                  ),

                  // Show products if this is an assistant message with products
                  if (message.isAssistant && message.products.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 440,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: message.products.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: 280,
                            margin: EdgeInsets.only(
                              right:
                                  index < message.products.length - 1 ? 12 : 0,
                            ),
                            child: ProductCard(
                              product: message.products[index],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final diff = now.difference(dateTime);

    if (diff.inMinutes < 1) {
      return 'Just now';
    } else if (diff.inHours < 1) {
      return '${diff.inMinutes}m ago';
    } else if (diff.inDays < 1) {
      return '${diff.inHours}h ago';
    } else {
      return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
    }
  }
}

class _MarkdownMessageContent extends StatelessWidget {
  final String content;

  const _MarkdownMessageContent({required this.content});

  @override
  Widget build(BuildContext context) {
    if (content.isEmpty) {
      return const SizedBox.shrink();
    }

    final config = MarkdownConfig.darkConfig.copy(
      configs: [
        PConfig(
          textStyle: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            height: 1.4,
          ),
        ),
        H1Config(
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        H2Config(
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        H3Config(
          style: const TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        CodeConfig(
          style: const TextStyle(
            color: Color(0xFF4ADEAA),
            backgroundColor: Color(0xFF1A1A1A),
            fontFamily: 'monospace',
          ),
        ),
      ],
    );

    return MarkdownWidget(
      data: content,
      config: config,
      shrinkWrap: true,
      selectable: true,
    );
  }
}
