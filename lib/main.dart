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
  final TextEditingController _controller = TextEditingController();

  // Initial messages to display in the chat
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: 'Hey, how are you?',
      author: const ChatAuthor(
        id: '123-001',
        name: 'Peter',
      ),
      time: DateTime.now().subtract(const Duration(minutes: 5)),
    ),
    ChatMessage(
      text: 'I am good, thanks! How about you?',
      author: const ChatAuthor(
        id: '123-002',
        name: 'Master',
      ),
      time: DateTime.now().subtract(const Duration(minutes: 4)),
    ),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfChat(
        messages: _messages, // Set initial messages
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
          decoration: _buildBoxDecoration(),
          child: Row(
            children: [
              _buildActionButton(Icons.add_rounded, () {
                /* This button handles the add/attachment functionality.
                 When pressed, it should open the attachment menu 
                 allowing users to select various types of content to share. */
              }),
              const SizedBox(width: 5.0),
              Expanded(child: _buildMessageInputField()),
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

  BoxDecoration _buildBoxDecoration() {
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

  Widget _buildActionButton(IconData icon, VoidCallback onPressed) {
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

  Widget _buildMessageInputField() {
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
          hintText: 'Message...',
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: _buildPrefixIcons(),
          suffixIcon: _buildSuffixIcons(),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _buildPrefixIcons() {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: IconButton(
        icon: Icon(
          Icons.alternate_email,
          color: Colors.grey.shade600,
          size: 20.0,
        ),
        onPressed: () {
          /* This button handles the email mention functionality.
             When pressed, it should trigger the mention picker dialog
             allowing users to tag/mention other users in the input. */
        },
      ),
    );
  }

  Widget _buildSuffixIcons() {
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
              /* This button initiates voice recording functionality.
                 When pressed, it should open the audio recorder 
                 allowing users to send voice messages. */
            },
          ),
          IconButton(
            icon: Icon(
              Icons.camera_alt_outlined,
              color: Colors.grey.shade600,
              size: 20.0,
            ),
            onPressed: () {
              /* This button handles the camera/image functionality.
                 When pressed, it should open the image picker 
                 allowing users to capture or select photos to send. */
            },
          ),
        ],
      ),
    );
  }
}
