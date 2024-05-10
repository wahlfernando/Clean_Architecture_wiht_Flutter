class MessagesStandart implements Exception {
  final String message;

  MessagesStandart({required this.message});

  @override
  String toString() {
    return message;
  }

}