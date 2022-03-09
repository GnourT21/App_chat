import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/pages/auth_page.dart';
import 'package:flutter/material.dart';

import '../pages/chat_page.dart';

class AutheProvider with ChangeNotifier {
  String _displayName = '';
  String _email = '';
  String _password = '';
  bool _isLogin = true;

  bool get isLogin => _isLogin;
  String get email => _email;
  String get password => _password;

  void toggleSignInBtn() {
    _isLogin = !_isLogin;
    notifyListeners();
  }

  void displayName(String name) {
    _displayName = name;
    notifyListeners();
  }

  void userMail(String input) {
    _email = input;
    notifyListeners();
  }

  void userPass(String input) {
    _password = input;
    notifyListeners();
  }

  void onSubmit(BuildContext ctx) async {
    final _auth = FirebaseAuth.instance;
    try {
      if (isLogin) {
        await _auth.signInWithEmailAndPassword(
            email: _email, password: _password);
      } else {
        await _auth.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(_auth.currentUser!.uid)
            .set({
          'email': _email,
          'username': _displayName,
        });
      }
      Navigator.of(ctx).pushNamed(ChatPage.route);
    } on FirebaseAuthException catch (e) {
      var mess = 'An error had been orrcured!';
      if (e.message != null) {
        mess = e.message!;
      }
      ScaffoldMessenger.of(ctx).showSnackBar(
        SnackBar(
          content: Text(mess),
        ),
      );
    } catch (e) {
      throw e.toString();
    }
  }

  void signOut(BuildContext ctx) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(ctx).pushNamed(AuthScreen.route);
  }
}
