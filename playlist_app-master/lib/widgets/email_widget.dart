// lib/widgets/email_widget.dart
import 'package:flutter/material.dart';
import '../model/email.dart';
import 'package:intl/intl.dart';

class EmailWidget extends StatefulWidget {
  final Email email;
  final VoidCallback onTap;
  final VoidCallback onLongPress;
  final VoidCallback onDismissed;
  final VoidCallback onToggleReadStatus;

  const EmailWidget({
    Key? key,
    required this.email,
    required this.onTap,
    required this.onLongPress,
    required this.onDismissed,
    required this.onToggleReadStatus,
  }) : super(key: key);

  @override
  _EmailWidgetState createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  bool isRead = false;

  @override
  void initState() {
    super.initState();
    isRead = widget.email.isRead;
  }

  void toggleReadStatus() {
    setState(() {
      isRead = !isRead;
      widget.onToggleReadStatus();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(widget.email.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => widget.onDismissed(),
      background: Container(color: const Color.fromARGB(255, 54, 152, 244)),
      child: ListTile(
        leading: Icon(
          isRead ? Icons.mark_email_read : Icons.mark_email_unread,
          color: isRead ? Colors.green : Colors.blue,
        ),
        title: Text(widget.email.sender, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.email.subject),
            Text(
              DateFormat('yyyy-MM-dd').format(widget.email.date),
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        onTap: () {
          toggleReadStatus();
          widget.onTap();
        },
        onLongPress: widget.onLongPress,
      ),
    );
  }
}