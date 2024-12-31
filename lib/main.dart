import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_chat/chat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat Example'),
      ),
      body: SfChat(
        messages: _messages,
        outgoingUser: '123-001',
        composer: _builderComposer(),
      ),
    );
  }

  ChatComposer _builderComposer() {
    return ChatComposer.builder(
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: _boxDecoration(),
          child: Row(
            children: [
              _actionButton(Icons.add_rounded, () {}),
              const SizedBox(width: 5.0),
              Expanded(child: _messageInputField()),
              const SizedBox(width: 7.0),
              const Icon(
                Icons.send_rounded,
                color: Color(0xFF433D8B),
              ),
            ],
          ),
        );
      },
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withAlpha((0.1 * 255).toInt()),
          spreadRadius: 2.0,
          blurRadius: 5.0,
        ),
      ],
    );
  }

  Widget _actionButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF433D8B),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(icon, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }

  Widget _messageInputField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextField(
        minLines: 1,
        maxLines: 6,
        controller: _controller,
        decoration: InputDecoration(
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
          hintText: 'Type a Message...',
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: _prefixIcons(),
          suffixIcon: _suffixIcons(),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _prefixIcons() {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: IconButton(
        icon: Icon(
          Icons.alternate_email,
          color: Colors.grey.shade600,
          size: 20.0,
        ),
        onPressed: () {
          // you can handle the action button logic here.
        },
      ),
    );
  }

  Widget _suffixIcons() {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              Icons.mic_none_rounded,
              color: Colors.grey.shade600,
              size: 20.0,
            ),
            onPressed: () {
              // you can handle the action button logic here.
            },
          ),
          IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey.shade600,
              size: 20.0,
            ),
            onPressed: () {
              // you can handle the action button logic here.
            },
          ),
        ],
      ),
    );
  }
}
