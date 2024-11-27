// lib/model/backend.dart
import 'email.dart';

class Backend {
  final List<Email> _emails = [
    Email(
      id: 1,
      subject: "Functional programming",
      content: "In computer science, functional programming is a programming paradigm...",
      sender: "functional@programming.com",
      date: DateTime(2020, 10, 3, 19, 43),
    ),
    Email(
      id: 2,
      subject: "Declarative programming",
      content: "Declarative programming is a style of building the structure and elements...",
      sender: "declarative@programming.com",
      date: DateTime(2020, 10, 7, 14, 20),
    ),
    Email(
      id: 3,
      subject: "Object-oriented programming",
      content: "Object-oriented programming (OOP) is a programming paradigm based on the concept of objects...",
      sender: "oop@programming.com",
      date: DateTime(2020, 10, 10, 10, 30),
    ),
    Email(
      id: 4,
      subject: "Procedural programming",
      content: "Procedural programming is a programming paradigm, derived from structured programming...",
      sender: "procedural@programming.com",
      date: DateTime(2020, 10, 12, 16, 45),
    ),
    Email(
      id: 5,
      subject: "Logic programming",
      content: "Logic programming is a programming paradigm which is largely based on formal logic...",
      sender: "logic@programming.com",
      date: DateTime(2020, 10, 15, 9, 15),
    ),
    Email(
      id: 6,
      subject: "Introduction to Algorithms",
      content: "Algorithms are a set of instructions for solving a problem or performing a task...",
      sender: "algorithms@cs.com",
      date: DateTime(2020, 10, 18, 11, 30),
    ),
    Email(
      id: 7,
      subject: "Data Structures",
      content: "Data structures are ways of organizing and storing data so that they can be accessed and modified efficiently...",
      sender: "datastructures@cs.com",
      date: DateTime(2020, 10, 20, 13, 45),
    ),
    Email(
      id: 8,
      subject: "Machine Learning",
      content: "Machine learning is a branch of artificial intelligence that focuses on building systems that learn from data...",
      sender: "machinelearning@ai.com",
      date: DateTime(2020, 10, 22, 15, 00),
    ),
    Email(
      id: 9,
      subject: "Deep Learning",
      content: "Deep learning is a subset of machine learning that uses neural networks with many layers...",
      sender: "deeplearning@ai.com",
      date: DateTime(2020, 10, 25, 17, 30),
    ),
    Email(
      id: 10,
      subject: "Natural Language Processing",
      content: "Natural language processing (NLP) is a field of artificial intelligence that focuses on the interaction between computers and humans...",
      sender: "nlp@ai.com",
      date: DateTime(2020, 10, 28, 19, 45),
    ),
    // Añade más correos electrónicos de ejemplo aquí
  ];

  List<Email> getEmails() {
    return _emails;
  }

  void markEmailAsRead(int id) {
    _emails.firstWhere((email) => email.id == id).isRead = true;
  }

  void toggleReadStatus(int id) {
    final email = _emails.firstWhere((email) => email.id == id);
    email.isRead = !email.isRead;
  }

  void deleteEmail(int id) {
    _emails.removeWhere((email) => email.id == id);
  }
}