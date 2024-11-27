// lib/screens/list_screen.dart
import 'package:flutter/material.dart';
import '../model/backend.dart';
import '../model/email.dart';
import '../widgets/email_widget.dart';
import 'detail_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Email> emails = [];

  @override
  void initState() {
    super.initState();
    fetchEmails();
  }

  void fetchEmails() {
    setState(() {
      emails = Backend().getEmails();
    });
  }

  void markEmailAsRead(int id) {
    Backend().markEmailAsRead(id);
    fetchEmails();
  }

  void toggleReadStatus(int id) {
    Backend().toggleReadStatus(id);
    fetchEmails();
  }

  void deleteEmail(int id) {
    Backend().deleteEmail(id);
    fetchEmails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bandeja de Entrada "),
        backgroundColor: const Color.fromARGB(255, 0, 89, 255),
      ),
      body: ListView.builder(
        itemCount: emails.length,
        itemBuilder: (context, index) {
          final email = emails[index];
          return EmailWidget(
            email: email,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(email: email),
                ),
              ).then((_) {
                markEmailAsRead(email.id);
              });
            },
            onLongPress: () => markEmailAsRead(email.id),
            onDismissed: () => deleteEmail(email.id),
            onToggleReadStatus: () => toggleReadStatus(email.id),
          );
        },
      ),
    );
  }
}