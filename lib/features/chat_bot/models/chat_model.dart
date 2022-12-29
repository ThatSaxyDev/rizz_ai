enum ChatType { user, bot }

class ChatText {
  ChatText({
    required this.text,
    required this.chatType,
  });

  final String text;
  final ChatType chatType;
}