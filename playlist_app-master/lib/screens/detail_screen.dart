// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../model/email.dart';

class DetailScreen extends StatelessWidget {
  final Email email;

  const DetailScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
        backgroundColor: const Color.fromARGB(255, 30, 148, 233),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: ${email.sender}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(email.subject, style: TextStyle(fontSize: 20)),
            Text(
              DateFormat('yyyy-MM-dd HH:mm').format(email.date),
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 16),
            Text(email.content),
          ],
        ),
      ),
    );
  }
}
