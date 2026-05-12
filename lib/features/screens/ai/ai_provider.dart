import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class AiProvider extends BaseProvider {
  final TextEditingController messageController = TextEditingController();

  final List<Map<String, String>> chatHistory = [
    {
      "type": "ai",
      "message":
          "Hello! I'm your AI health assistant. I can help you find the best hospitals, compare treatment options, estimate costs, and guide you through your medical tourism journey.",
    },

    {
      "type": "user",
      "message": "I need knee replacement surgery. What are my options?",
    },

    {
      "type": "ai",
      "message":
          "I found 3 excellent options for knee replacement:\n\n🏥 Apollo Hospital, India - \$4,500\n✅ 98% success rate\n\n🏥 Bumrungrad Hospital, Thailand - \$6,200\n✅ 97% success rate",
    },
  ];

  final List<String> suggestedQuestions = [
    'Find best hospital for knee surgery',
    'Compare costs in Thailand vs India',
    'Medical visa documents needed',
    'Show recovery timeline',
  ];

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    chatHistory.add({"type": "user", "message": messageController.text});

    chatHistory.add({
      "type": "ai",
      "message":
          "Thanks for your message. Our AI assistant is analyzing your request.",
    });

    messageController.clear();

    notifyListeners();
  }

  void addSuggestedQuestion(String text) {
    messageController.text = text;
    notifyListeners();
  }
}
