import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../pages/chat_page.dart';

class AutheProvider with ChangeNotifier {
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
}
