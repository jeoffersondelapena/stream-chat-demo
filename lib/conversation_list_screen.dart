import 'package:flutter/material.dart';
import 'package:stream_chat_demo/conversation_screen.dart';
import 'package:stream_chat_demo/main.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ConversationListScreen extends StatelessWidget {
  const ConversationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StreamChannelListHeader(),
      body: StreamChannelListView(
        controller: StreamChannelListController(
          client: StreamChat.of(context).client,
        ),
        onChannelTap: (channel) {
          navigateTo(
            context,
            StreamChannel(
              channel: channel,
              child: const ConversationScreen(),
            ),
          );
        },
      ),
    );
  }
}
