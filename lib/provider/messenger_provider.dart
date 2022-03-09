import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MessengerProvider with ChangeNotifier {
  String? _mess;
  String get mess => _mess!;

  final _fireBase = FirebaseFirestore.instance;
  final _user = FirebaseAuth.instance.currentUser;

  void setMessage(String mess) {
    _mess = mess;
    notifyListeners();
  }

  void sendMessage() async {
    await _fireBase.collection('chats').add({
      'text': _mess,
      'createdAt': Timestamp.now(),
      'uid': _user!.uid,
    });
  }
}
