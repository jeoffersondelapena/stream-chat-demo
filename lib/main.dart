import 'package:flutter/material.dart';
import 'package:stream_chat_demo/convo_screen.dart';
import 'package:stream_chat_flutter/stream_chat_flutter.dart';

void main() async {
  final client = StreamChatClient('yhfdwrmse24q', logLevel: Level.INFO);

  await client.connectUser(
    User(id: 'jeo'),
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiamVvIn0.8fI0KLUoXWUmRDj8k0d9PQbxIsjKeFzo1KSMSKFU1-M',
  );

  final channel = client.channel(
    'messaging',
    id: 'stream-chat-ph',
  );

  await channel.watch();

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      builder: (context, child) {
        return StreamChat(client: client, child: child);
      },
      home: const ConvoScreen(),
    ),
  );
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.of(context).push(
    MaterialPageRoute<StreamChannel>(
      builder: (context) {
        return widget;
      },
    ),
  );
}
