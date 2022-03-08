import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MessengerProvider with ChangeNotifier {
  String? _mess;
  String? _sender;

  String get mess => _mess!;
  String get sender => _sender!;

  final fireBase = FirebaseFirestore.instance;

  void setMessage(String mess) {
    _mess = mess;
    notifyListeners();
  }

  void sendMessage() async {
    await fireBase.collection('chats').add({
      'text': _mess,
      'createdAt': Timestamp.now(),
    });
  }
}
