import 'package:flash_chat/provider/auth.dart';
import 'package:flash_chat/ultilities/constrains.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/auth_form.dart';

class AuthScreen extends StatelessWidget {
  static const String route = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: double.infinity,
              height: context.watch<AutheProvider>().isLogin ? 120 : 80,
              child: const Image(
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/bg-01.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Hello',
                    style: kTextTitle60,
                  ),
                  Text(
                    'Sign in to your account',
                    style: kTitleRegular,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  AuthForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
