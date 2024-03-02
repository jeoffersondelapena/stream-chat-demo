import 'package:flutter/material.dart';

class ConvoScreen extends StatefulWidget {
  const ConvoScreen({super.key});

  @override
  State<ConvoScreen> createState() => _ConvoScreenState();
}

class _ConvoScreenState extends State<ConvoScreen> {
  final TextEditingController _messageInputController = TextEditingController();

  final List<String> _messages = [];

  void _sendMessage(String message) {
    if (message.isEmpty) {
      return;
    }

    setState(() {
      _messages.add(message);
    });

    _messageInputController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Conversation Screen')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Expanded(
              child: _messages.isEmpty
                  ? const Center(child: Text('No message yet...'))
                  : ListView.builder(
                      itemCount: _messages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(_messages[index]),
                        );
                      },
                    ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageInputController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_messageInputController.text.trim());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
