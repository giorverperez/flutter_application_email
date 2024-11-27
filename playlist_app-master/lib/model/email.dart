// lib/model/email.dart
class Email {
  final int id;
  final String subject;
  final String content;
  final String sender;
  final DateTime date;
  bool isRead;

  Email({
    required this.id,
    required this.subject,
    required this.content,
    required this.sender,
    required this.date,
    this.isRead = false,
  });
}

