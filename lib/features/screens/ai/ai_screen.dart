import 'package:flutter/material.dart';
import 'package:mediviora_app/widget/ui_design.dart';
import 'package:provider/provider.dart';

import '../../../widget/help_widget.dart';
import '../../../widget/rotating_ai_orb.dart';
import 'ai_provider.dart';

class AiScreen extends StatelessWidget {
  const AiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AiProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF8FAFC),

          body: Stack(
            children: [

              /// BACKGROUND
              appBackground(),

              Column(
                children: [

                  _header(context, provider),

                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),

                      children: [

                        ...provider.chatHistory.map(
                              (chat) => _chatBubble(
                            isUser:
                            chat["type"] == "user",

                            message:
                            chat["message"] ?? "",
                          ),
                        ),

                        spaceHeight(20),

                        const Text(
                          "Suggested Questions",

                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF0F172A),
                          ),
                        ),

                        spaceHeight(14),

                        ...provider.suggestedQuestions.map(
                              (question) => _suggestionCard(
                            text: question,
                            onTap: () {
                              provider.addSuggestedQuestion(
                                question,
                              );
                            },
                          ),
                        ),

                        spaceHeight(100),
                      ],
                    ),
                  ),

                  /// INPUT AREA
                  _inputArea(provider),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _header(BuildContext context,AiProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          /// AI ORB
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => provider.back(context),

                child: Container(
                  width: 48,
                  height: 48,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white.withOpacity(0.85),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),

                  child: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 20,
                    color: Color(0xFF0F172A),
                  ),
                ),
              ),
              RotatingAiOrb(),
              spaceWidth(10),
            ],
          ),

          spaceHeight(18),

          const Text(
            "AI Health Assistant",

            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color(0xFF0F172A),
            ),
          ),

          spaceHeight(8),

          Text(
            "Powered by Advanced Medical AI",

            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }

  /// CHAT BUBBLE
  Widget _chatBubble({
    required bool isUser,
    required String message,
  }) {
    return Align(
      alignment: isUser
          ? Alignment.centerRight
          : Alignment.centerLeft,

      child: Container(
        margin: const EdgeInsets.only(bottom: 14),

        padding: const EdgeInsets.all(18),

        constraints: const BoxConstraints(
          maxWidth: 320,
        ),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),

          gradient: isUser
              ? const LinearGradient(
            colors: [
              Color(0xFF00D1FF),
              Color(0xFF8B7CFF),
            ],
          )
              : null,

          color: isUser
              ? null
              : Colors.white.withOpacity(0.88),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 16,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            if (!isUser)
              Row(
                children: [

                  Container(
                    width: 26,
                    height: 26,

                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,

                      gradient: LinearGradient(
                        colors: [
                          Color(0xFF00D1FF),
                          Color(0xFF8B7CFF),
                        ],
                      ),
                    ),

                    child: const Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                      size: 14,
                    ),
                  ),

                  spaceWidth(8),

                  const Text(
                    "MediViora AI",

                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF00D1FF),
                    ),
                  ),
                ],
              ),

            if (!isUser) spaceHeight(12),

            Text(
              message,

              style: TextStyle(
                color: isUser
                    ? Colors.white
                    : const Color(0xFF0F172A),

                fontSize: 15,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// SUGGESTION CARD
  Widget _suggestionCard({
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.only(bottom: 12),

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: Colors.white.withOpacity(0.88),

          border: Border.all(
            color: Colors.white.withOpacity(0.7),
          ),
        ),

        child: Row(
          children: [

            Container(
              width: 36,
              height: 36,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF8B7CFF)
                    .withOpacity(0.12),
              ),

              child: const Icon(
                Icons.flash_on,
                color: Color(0xFF8B7CFF),
              ),
            ),

            spaceWidth(14),

            Expanded(
              child: Text(
                text,

                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF0F172A),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// INPUT AREA
  Widget _inputArea(AiProvider provider) {
    return Container(
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.82),

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),

      child: Row(
        children: [

          /// MIC
          Container(
            width: 52,
            height: 52,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),

              color: const Color(0xFF8B7CFF)
                  .withOpacity(0.12),
            ),

            child: const Icon(
              Icons.mic,
              color: Color(0xFF8B7CFF),
            ),
          ),

          spaceWidth(12),

          /// TEXTFIELD
          Expanded(
            child: TextField(
              controller: provider.messageController,

              decoration: InputDecoration(
                hintText:
                "Ask about your health journey...",

                filled: true,
                fillColor: Colors.white,

                contentPadding:
                const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),

                border: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(18),

                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          spaceWidth(12),

          /// SEND BUTTON
          GestureDetector(
            onTap: provider.sendMessage,

            child: Container(
              width: 54,
              height: 54,

              decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(18),

                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF00D1FF),
                    Color(0xFF8B7CFF),
                  ],
                ),

                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00D1FF)
                        .withOpacity(0.3),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),

              child: const Icon(
                Icons.send,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}